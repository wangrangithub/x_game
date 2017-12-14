package com.game.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.nutz.castor.Castors;
import org.nutz.lang.Times;

public class TimeUtils {

	/** 毫秒 */
	public static final long MILLI_SECOND = TimeUnit.MILLISECONDS.toMillis(1);
	/** 秒 */
	public static final long SECOND = TimeUnit.SECONDS.toMillis(1);
	/** 分 */
	public static final long MIN = TimeUnit.MINUTES.toMillis(1);
	/** 时 */
	public static final long HOUR = TimeUnit.HOURS.toMillis(1);
	/** 天 */
	public static final long DAY = TimeUnit.DAYS.toMillis(1);

	public static final String pattern_yyyyMMdd = "yyyy-MM-dd";
	public static final String pattern_yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
	public static final String pattern_yyyyMMddHHmmss_special = "yyyy-MM-dd^HH-mm-ss";
	// ...其他有需要自己定义这把
	public static final SimpleDateFormat formatPattern1 = new SimpleDateFormat(pattern_yyyyMMdd);
	public static final SimpleDateFormat formatPattern2 = new SimpleDateFormat(pattern_yyyyMMddHHmmss);
	public static final SimpleDateFormat formatPattern3 = new SimpleDateFormat("yyyyMMdd");
	public static final SimpleDateFormat formatPattern4 = new SimpleDateFormat(pattern_yyyyMMddHHmmss_special);

	public static boolean anotherDay(Date day1) {
		return !DateUtils.isSameDay(day1, new Date());
	}

	public static boolean anotherWeek(Date day) {
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(day);
		cal2.setTime(new Date());

		int week1 = cal1.get(Calendar.WEEK_OF_YEAR);
		if (cal1.get(Calendar.DAY_OF_WEEK) == 1) {
			week1 = week1 - 1;
		}

		int week2 = cal2.get(Calendar.WEEK_OF_YEAR);
		if (cal2.get(Calendar.DAY_OF_WEEK) == 1) {
			week2 = week2 - 1;
		}

		return week1 != week2;
	}

	public static boolean anotherMonth(Date day) {
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(day);
		cal2.setTime(new Date());
		return cal1.get(Calendar.MONTH) != cal2.get(Calendar.MONTH)
				|| cal1.get(Calendar.YEAR) != cal2.get(Calendar.YEAR);
	}

	public static String formatTime(long timeMillis, String formatPattern) {
		SimpleDateFormat sdFormat = null;
		if (pattern_yyyyMMddHHmmss.equals(formatPattern)) {
			sdFormat = formatPattern2;
		} else if (pattern_yyyyMMdd.equals(formatPattern)) {
			sdFormat = formatPattern1;
		} else {
			sdFormat = new SimpleDateFormat(formatPattern);
		}

		return sdFormat.format(new Date(timeMillis));
	}

	public static int CompareToByDay(Calendar dayone, Calendar daytwo) {
		if (dayone.get(Calendar.YEAR) > daytwo.get(Calendar.YEAR)) {
			return 1;
		} else if (dayone.get(Calendar.YEAR) < daytwo.get(Calendar.YEAR)) {
			return -1;
		} else {
			if (dayone.get(Calendar.MONTH) > daytwo.get(Calendar.MONTH)) {
				return 1;
			} else if (dayone.get(Calendar.MONTH) < daytwo.get(Calendar.MONTH)) {
				return -1;
			} else {
				if (dayone.get(Calendar.DAY_OF_MONTH) > daytwo.get(Calendar.DAY_OF_MONTH)) {
					return 1;
				} else if (dayone.get(Calendar.DAY_OF_MONTH) < daytwo.get(Calendar.DAY_OF_MONTH)) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}

	/**
	 * 计算两个日期间相差的天数(按24小时算)
	 * 
	 * @param enddate
	 * @param begindate
	 * @return
	 */
	public static int getIntervalDays(Date enddate, Date begindate) {
		long millisecond = enddate.getTime() - begindate.getTime();
		int day = (int) (millisecond / 24l / 60l / 60l / 1000l);
		return day;
	}

	/**
	 * 计算两个日期间相差的天数(按24小时算)
	 * 
	 * @param enddate
	 * @param begindate
	 * @return
	 */
	public static int getIntervalDays(long enddate, long begindate) {
		long millisecond = enddate - begindate;
		int day = (int) (millisecond / 24l / 60l / 60l / 1000l);
		return day;
	}

	/**
	 * 计算两个日期间相差的分钟数
	 * 
	 * @param enddate
	 * @param begindate
	 * @return
	 */
	public static int getIntervalMinutes(Date enddate, Date begindate) {
		long millisecond = enddate.getTime() - begindate.getTime();
		int minute = (int) (millisecond / 60l / 1000l);
		return minute;
	}

	public static boolean isInToday(Date date1, Date date2) {
		return DateUtils.isSameDay(date1, date2);
		// boolean isToday = false;
		// if(0 < checkedTime) {
		// Date date = new Date();
		// SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// String todayStr = format.format(date);
		// try {
		// Date todayZero = format.parse(todayStr);
		// long dif = checkedTime - todayZero.getTime();
		// isToday = (0 <= dif && dif < 86400000);
		// } catch (ParseException e) {
		// e.printStackTrace();
		// }
		// }
		// return isToday;
	}

	public static boolean isInToday(long date1, long date2) {
		Date d1 = new Date(date1);
		Date d2 = new Date(date2);
		return DateUtils.isSameDay(d1, d2);
	}

	public static String getYesterDay() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String yesterday = formatPattern1.format(cal.getTime());
		return yesterday;
	}

	public static long getDay(int day) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -day);
		return cal.getTime().getTime();
	}

	public static String getTomorrowDay() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +1);
		String tomorrowDay = formatPattern1.format(cal.getTime());
		return tomorrowDay;
	}

	public static int getDay(int curr, int days) throws ParseException {
		Date date = Times.parse(formatPattern3, String.valueOf(curr));
		Calendar cal = Times.C(date);
		cal.add(Calendar.DATE, +days);
		String day = formatPattern3.format(cal.getTime());
		return NumberUtils.toInt(day);
	}

	public static String getTodayDay() {
		Calendar cal = Calendar.getInstance();
		// cal.add(Calendar.DATE,0);
		String todayDay = formatPattern1.format(cal.getTime());
		return todayDay;
	}

	/**
	 * normalTim 标准
	 */
	public static boolean isBefore(Date d, long normalTim) {
		return d.before(new Date(normalTim));
	}


	public static long getYesterDayLong() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return cal.getTime().getTime();
	}
	
	/**
	 * 转换指定时间为毫秒值
	 * 
	 * @param baseServerCanlenadar
	 *            以服务器的时间戳为准
	 * @param year
	 * @param month
	 * @param day
	 * @param hour
	 * @param min
	 * @param second
	 * @param ss
	 * @return
	 */
	public static long timeTolong(long baseServerCanlenadar, int year, int month, int day, int hour, int min,
			int second, int ss) {
		Calendar cal = Times.C(baseServerCanlenadar);
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DATE, day);
		cal.set(Calendar.HOUR_OF_DAY, hour);
		cal.set(Calendar.MINUTE, min);
		cal.set(Calendar.SECOND, second);
		cal.set(Calendar.MILLISECOND, ss);
		return cal.getTimeInMillis();
	}

	/**
	 * 某时间距离现在时间的秒数差值
	 * 
	 * @param baseServerCanlenadar
	 * @param hour
	 * @param min
	 * @return
	 */
	public static int diffTimeOfNow(long baseServerCanlenadar, int hour, int min) {
		int diffVal = 0;
		Calendar cal = Times.C(baseServerCanlenadar);
		cal.set(Calendar.HOUR_OF_DAY, hour);
		cal.set(Calendar.MINUTE, min);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		long aimTime = cal.getTimeInMillis();
		diffVal = (int) (aimTime - baseServerCanlenadar);
		return diffVal;
	}

	/**
	 * 某时间距离现在时间的秒数差值
	 * 
	 * @param baseServerCanlenadar
	 * @param hour
	 * @param min
	 * @return
	 */
	public static int diffTimeOfNow(long baseServerCanlenadar, int hour, int min, int weeks) {
		int diffVal = 0;
		Calendar cal = Times.C(baseServerCanlenadar);
		cal.set(Calendar.HOUR_OF_DAY, hour);
		cal.set(Calendar.MINUTE, min);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		int todayweek = cal.get(Calendar.DAY_OF_WEEK);
		todayweek = todayweek - 1;// 周日变成0,其他顺次-1
		if (todayweek == 0) {
			todayweek = 7;
		}
		if (todayweek == weeks) {
			long aimTime = cal.getTimeInMillis();
			diffVal = (int) (aimTime - baseServerCanlenadar);
		} else {
			if (todayweek > weeks) {
				diffVal = -24 * 1000 * 60 * 60;
			} else {
				diffVal = 24 * 1000 * 60 * 60;
			}
		}
		return diffVal;
	}

	/**
	 * 获取年、月、日到某天的时间差值
	 * 
	 * @param baseServerCanlenadar
	 * @param year
	 * @param month
	 * @param day
	 * @return
	 */
	public static long diffOfNow(long baseServerCanlenadar, int year, int month, int day) {
		long diffVal = 0l;
		Calendar cal = Times.C(baseServerCanlenadar);
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DATE, day);
		long aimTime = cal.getTimeInMillis();
		diffVal = (int) (aimTime - baseServerCanlenadar);
		return diffVal;
	}

	public static String getDayFormat(int fix, long serverCurrentTimeMillis) {
		Calendar calendar = Times.C(serverCurrentTimeMillis);
		calendar.add(Calendar.DATE, fix);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		String day = Times.sD(calendar.getTime());
		return day;
	}

	public static long getDateFormat(int fix, long serverCurrentTimeMillis) {
		Calendar calendar = Times.C(serverCurrentTimeMillis);
		calendar.add(Calendar.DATE, fix);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime().getTime();
	}

	public static String DateFormat(Calendar calendar, int fix) {
		calendar.add(Calendar.DATE, fix);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		String day = Times.sD(calendar.getTime());
		return day;
	}

	/**
	 * @param time
	 *            "2008-06-20 05:46:26"
	 * @return
	 */
	public static Calendar Str2Calendar(String time) {
		Calendar c = Castors.me().cast(time, String.class, Calendar.class);
		return c;
	}

	/**
	 * time "2008-6-12"
	 * 
	 * @return
	 */
	public Date str2Date(String time) {
		java.util.Date date = Castors.me().castTo(time, java.util.Date.class);
		return date;
	}

	public static long str2TimeMillis(String time) {
		Calendar c2 = Castors.me().cast(time, String.class, Calendar.class);
		return c2.getTimeInMillis();
	}

	/**
	 * Calendar c2 = Castors.me().cast("2008-06-20 05:46:26", String.class,
	 * Calendar.class);
	 */
	public static long getStartActiveTime(long serverStartTime, int day, String timeHour) {
		Calendar c2 = Castors.me().cast(getStartActiveTimeStr(serverStartTime, day, timeHour), String.class,
				Calendar.class);
		return c2.getTimeInMillis();
	}

	public static String getStartActiveTimeStr(long serverStartTime, int day, String timeHour) {
		Calendar c = Castors.me().cast(serverStartTime, Long.class, Calendar.class);
		c.add(Calendar.DATE, day);
		String yesterday = formatPattern1.format(c.getTime());
		return yesterday + " " + timeHour;
	}

	public static String getStartActiveTimeStr(String serverStartTime, int day, String timeHour) {
		Calendar c = Castors.me().cast(serverStartTime, String.class, Calendar.class);
		c.add(Calendar.DATE, day);
		String yesterday = formatPattern1.format(c.getTime());
		return yesterday + " " + timeHour;
	}

	/**
	 * @param date1
	 *            需要比较的时间 不能为空(null),需要正确的日期格式 ,如：2009-09-12
	 * @param date2
	 *            被比较的时间 为空(null)则为当前时间
	 * @param stype
	 *            返回值类型 0为多少天，1为多少个月，2为多少年
	 * @return 举例： compareDate("2009-09-12", null, 0);//比较天
	 *         compareDate("2009-09-12", null, 1);//比较月
	 *         compareDate("2009-09-12", null, 2);//比较年
	 */
	public static int compareDate(String startDay, String endDay, int stype) {
		int n = 0;
		//
		// String[] u = { "天", "月", "年" };
		String formatStyle = stype == 1 ? "yyyy-MM" : "yyyy-MM-dd";

		endDay = endDay == null ? getCurrentDate("yyyy-MM-dd") : endDay;

		DateFormat df = new SimpleDateFormat(formatStyle);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		try {
			c1.setTime(df.parse(startDay));
			c2.setTime(df.parse(endDay));
		} catch (Exception e3) {
			System.out.println("wrong occured");
		}
		// List list = new ArrayList();
		while (!c1.after(c2)) { // 循环对比，直到相等，n 就是所要的结果
			// list.add(df.format(c1.getTime())); // 这里可以把间隔的日期存到数组中 打印出来
			n++;
			if (stype == 1) {
				c1.add(Calendar.MONTH, 1); // 比较月份，月份+1
			} else {
				c1.add(Calendar.DATE, 1); // 比较天数，日期+1
			}
		}
		n = n - 1;
		if (stype == 2) {
			n = (int) n / 365;
		}
		// System.out.println(startDay + " -- " + endDay + " 相差多少" + u[stype]+
		// ":" + n);
		return n;
	}

	public static String getCurrentDate() {
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, 0);
		String date = formatPattern3.format(day.getTime());
		return date;
	}

	public static String getCurrentDate(String format) {
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, 0);
		SimpleDateFormat formatPattern3 = new SimpleDateFormat(format);
		String date = formatPattern3.format(day.getTime());
		return date;
	}

	/**
	 * 获取下个时间点
	 * 
	 * @param interval
	 *            间隔，单位毫秒
	 * @return
	 */
	public static long getNextMatchTime(int interval) {
		Date date = new Date();
		long temp = (long) (date.getTime() / interval);
		date.setTime((temp + 1) * interval);
		return date.getTime();
	}

	public static Date getNextMatchTime(Date beginTime, long interval) {
		long now = System.currentTimeMillis();
		if (now < beginTime.getTime()) {
			return beginTime;
		}
		double temp = (now - beginTime.getTime()) / (interval * 1.0D);
		int count = new Double(Math.ceil(temp)).intValue();
		beginTime.setTime(beginTime.getTime() + count * interval);
		return beginTime;
	}

	/**
	 * 获取竞技场周结算时间点
	 * 
	 * @param weekDiff
	 * @param hour
	 * @param minute
	 * @return
	 */
	public static Calendar getArenaWeekTime(int weekDiff, int hour, int minute) {
		Calendar date = Calendar.getInstance();
		date.add(Calendar.WEEK_OF_MONTH, weekDiff);
		date.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		date.set(Calendar.HOUR_OF_DAY, hour);
		date.set(Calendar.MINUTE, minute);
		date.set(Calendar.SECOND, 0);
		return date;
	}

	public static long now() {
		return System.currentTimeMillis();
	}

	/**
	 * 获取特定日期当天的零点时间
	 * 
	 * @return
	 */
	public static long getBeginOfDay(long time) {
		Calendar _calendar = Calendar.getInstance();
		_calendar.setTimeInMillis(time);
		_calendar.set(Calendar.HOUR_OF_DAY, 0);
		_calendar.set(Calendar.MINUTE, 0);
		_calendar.set(Calendar.SECOND, 0);
		_calendar.set(Calendar.MILLISECOND, 0);
		return _calendar.getTimeInMillis();
	}
	
	/**
	 * 获取特定日期当天的23：59：59时间
	 * 
	 * @return
	 */
	public static long getEndOfDay(long time) {
		Calendar _calendar = Calendar.getInstance();
		_calendar.setTimeInMillis(time);
		_calendar.set(Calendar.HOUR_OF_DAY, 23);
		_calendar.set(Calendar.MINUTE, 59);
		_calendar.set(Calendar.SECOND, 59);
		_calendar.set(Calendar.MILLISECOND, 0);
		return _calendar.getTimeInMillis()+1000;
	}

	/**
	 * 当前到下一天的时间(秒)
	 * 
	 * @return s(秒)
	 */
	public static long toNextDay() {
		long now = now();
		long begin = getBeginOfDay(now);
		return (long) Math.ceil(((begin + DAY) - now) * 0.001);
	}

	/**
	 * 当前到下一周的时间
	 * 
	 * @return s(秒)
	 */
	public static long toNextWeek() {
		long now = now();
		Calendar _calendar = Times.C(now);
		int week = _calendar.get(Calendar.WEEK_OF_YEAR);
		if (_calendar.get(Calendar.DAY_OF_WEEK) == 1) {
			_calendar.set(Calendar.WEEK_OF_YEAR, week);
			_calendar.set(Calendar.DAY_OF_WEEK, 2);
		} else {
			_calendar.set(Calendar.WEEK_OF_YEAR, week + 1);
			_calendar.set(Calendar.DAY_OF_WEEK, 2);
		}
		_calendar.set(Calendar.HOUR_OF_DAY, 0);
		_calendar.set(Calendar.MINUTE, 0);
		_calendar.set(Calendar.SECOND, 0);
		_calendar.set(Calendar.MILLISECOND, 0);
		return (_calendar.getTimeInMillis() - now) / 1000;
	}

	/**
	 * 当前到下一月的时间
	 * 
	 * @return s(秒)
	 */
	public static long toNextMonth() {
		long now = now();
		Calendar _calendar = Times.C(now);
		int month = _calendar.get(Calendar.MONTH);

		_calendar.set(Calendar.MONTH, month + 1);
		_calendar.set(Calendar.DAY_OF_MONTH, 1);
		_calendar.set(Calendar.HOUR_OF_DAY, 0);
		_calendar.set(Calendar.MINUTE, 0);
		_calendar.set(Calendar.SECOND, 0);
		_calendar.set(Calendar.MILLISECOND, 0);

		return (_calendar.getTimeInMillis() - now) / 1000;
	}

	public static Date getDate(String time) throws ParseException {
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		return df.parse(time);
	}

	public static void main(String[] args) {
		String str = getTimeSpecial();
		System.err.println(str);
	}

	public static int getRangeDays(long beginTime, long endTime) {
		int rangeDays = 0;
		Calendar ca1 = Calendar.getInstance();
		ca1.setTimeInMillis(beginTime);

		Calendar ca2 = Calendar.getInstance();
		ca2.setTimeInMillis(endTime);

		int year1 = ca1.get(Calendar.YEAR);
		int year2 = ca2.get(Calendar.YEAR);
		// 判断是否是同一年
		if (year1 == year2) {
			rangeDays = ca2.get(Calendar.DAY_OF_YEAR) - ca1.get(Calendar.DAY_OF_YEAR);
		} else if (year2 > year1) {
			int max = ca1.getActualMaximum(Calendar.DAY_OF_YEAR);
			int firstDay = max - ca1.get(Calendar.DAY_OF_YEAR);
			rangeDays = firstDay + ca2.get(Calendar.DAY_OF_YEAR);
			// 假如超过一年，则加上中间这些年的天数
			if (year2 - year1 > 1) {
				for (int i = year1 + 1; i < year2; i++) {
					Calendar ca = Calendar.getInstance();
					ca.set(Calendar.YEAR, i);
					int maxday = ca.getActualMaximum(Calendar.DAY_OF_YEAR);
					rangeDays += maxday;
				}
			}
		}

		return rangeDays;
	}

	public static boolean isSameWeek(long time1, long time2) {

		Calendar ca1 = Calendar.getInstance();
		ca1.setTimeInMillis(time1);

		Calendar ca2 = Calendar.getInstance();
		ca2.setTimeInMillis(time2);

		return ca1.get(Calendar.YEAR) == ca2.get(Calendar.YEAR)
				&& ca1.get(Calendar.WEEK_OF_YEAR) == ca2.get(Calendar.WEEK_OF_YEAR);

	}
	
	public static String getTimeSpecial(){
		String time = formatPattern4.format(new Date());
		return time;
	}
}
