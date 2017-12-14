package com.game.util;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

public class CsvWriter {

	/** CSV文件列分隔符 */
	private static final String CSV_COLUMN_SEPARATOR = ",";

	/** CSV文件列分隔符 */
	private static final String CSV_RN = "\r\n";

	/**
	 * 
	 * 将检索数据输出的对应的csv列中
	 * 
	 * 修改了导出cdk为单列导出的--by AnDong.Yu  2017-8-16
	 * 
	 * 
	 */
	public static String formatCsvData(String[] data, String displayColNames, String matchColNames) {

		StringBuffer buf = new StringBuffer();

		String[] displayColNamesArr = null;
		// String[] matchColNamesMapArr = null;

		displayColNamesArr = displayColNames.split(",");
		// matchColNamesMapArr = matchColNames.split(",");

		// 输出列头
		for (int i = 0; i < displayColNamesArr.length; i++) {
			buf.append(displayColNamesArr[i]).append(CSV_COLUMN_SEPARATOR);
		}
		buf.append(CSV_RN);

		if (null != data) {
			// 输出数据
			for (int i = 0; i < data.length; i++) {

				buf.append(data[i]).append(CSV_COLUMN_SEPARATOR);
				buf.append(CSV_RN);
			}
		}
		return buf.toString();
	}

	public static void exportCsv(String fileName, String content, HttpServletResponse response) throws IOException {

		// 设置文件后缀
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhh24mmss");
		String fn = fileName.concat(sdf.format(new Date()).toString() + ".csv");

		// 读取字符编码
		// String csvEncoding = PropertiesUtil.getProperty("CSV_ENCODING");

		// 设置响应
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/csv; charset=" + "UTF-8");
		response.setHeader("Pragma", "public");
		response.setHeader("Cache-Control", "max-age=30");
		response.setHeader("Content-Disposition", "attachment; filename=" + new String(fn.getBytes(), "UTF-8"));

		// 写出响应
		OutputStream os = response.getOutputStream();
		os.write(content.getBytes("GBK"));
		os.flush();
		os.close();
	}

}