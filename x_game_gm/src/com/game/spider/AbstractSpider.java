package com.game.spider;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.nutz.http.Http;
import org.nutz.lang.ContinueLoop;
import org.nutz.lang.Each;
import org.nutz.lang.ExitLoop;
import org.nutz.lang.Lang;
import org.nutz.lang.LoopException;

import com.game.util.LogUtils;
import com.game.util.TimeUtils;
import com.rekoe.utils.StrUtils;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.pipeline.ConsolePipeline;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;
import us.codecraft.webmagic.selector.Selectable;


/**
 * 爬虫抽象类
 * 
 * @author User
 *
 */
public abstract class AbstractSpider implements PageProcessor{
	
	private Site site = Site.me().
			setRetryTimes(3)
			.setSleepTime(1000)
			.setUserAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31");
	
	private Spider spider = Spider.create(this);
	
	protected List<MainData> hrefs = new ArrayList<>();
	
	protected ConcurrentHashMap<String, String> url2Img = new ConcurrentHashMap<>();

	protected ConcurrentHashMap<String, Integer> url2Tag = new ConcurrentHashMap<>(16);
	
	public static final String SPLIT = "_";
	
	public AbstractSpider() {
		spider = spider.addPipeline(new ConsolePipeline()).thread(1);
	}
	
	@Override
	public Site getSite() {
		return site;
	}
	
	@Override
	public void process(Page page) {
		String mainUrl = page.getRequest().getUrl();
		boolean isTarget = true;
		String[][] urls = Lang.isEmptyArray(this.urls) ? urls() : this.urls;
		for (String[] url : urls) {
			if (Lang.equals(url[0], mainUrl)) {
				isTarget = false;
				hrefs.clear();
				List<MainData> hrefs = takeHrefs(page);
				page.setSkip(true);
				List<String> targetUrls = new ArrayList<>();
				for (MainData mainData : hrefs) {
					targetUrls.add(mainData.getUrl());
					url2Tag.put(mainData.getUrl(), NumberUtils.toInt(url[1]));
					if (StringUtils.isNotBlank(mainData.getImage())) {
						url2Img.put(mainData.getUrl(), mainData.getImage());
					}
				}
				page.addTargetRequests(targetUrls);
				break;
			}
		}
		if (!isTarget) {
			try {
				String url = page.getRequest().getUrl();
				Integer tag = url2Tag.get(url);
				if (tag == null) {
					LogUtils.spider.error("can not find url %s tag ", url);
					return;
				}
				
				takeContent(page);
				String title = page.getResultItems().get("title");
				String content = clearContent(page.getResultItems().get("content"));
				String time = page.getResultItems().get("time");
				
				System.out.println("标题="+title);
				System.out.println("内容="+content);
				System.out.println("时间="+time);
				//TODO database option
			} catch (Exception e) {
				LogUtils.spider.error("webmagic error %s, exception %s ", getTaskClass(),e);
			}
		}
	}
	
	private String[][] urls;
	
	protected void addMainData(String link) {
		addMainData(link, "");
	}

	protected void addMainData(String link, String image) {
		if (StringUtils.isBlank(link)) {
			return;
		}
		hrefs.add(new MainData(link, image));
	}
	
	protected void putField(Page page, String title, String content, String time) {
		page.putField("title", title);
		page.putField("content", content);
		page.putField("time", StringUtils.defaultIfBlank(time, ""));
	}
	protected void putField(Page page, String title, String content) {
		page.putField("title", title);
		page.putField("content", content);
	}
	
	public abstract String domain();
	
	public abstract void takeContent(Page page);
	/**
	 * 获取超级链接
	 * @param page
	 * @return
	 */
	public abstract List<MainData> takeHrefs(Page page);
	
	public void execute() {
		try {
			String[][] trueUrls = Lang.isEmptyArray(this.urls) ? urls() : this.urls;
			String[] urls = new String[trueUrls.length];
			Lang.each(trueUrls, new Each<String[]>() {
				@Override
				public void invoke(int index, String[] ele, int length) throws ExitLoop, ContinueLoop, LoopException {
					urls[index] = (ele[0]);
				}
			});
			spider.addUrl(urls);
			spider.start();
		} catch (Exception e) {
			LogUtils.spider.error("class %s run error %s ", this.getTaskClass(), e);
		}
	}
	
	public abstract String[][] urls();
	
	protected Html getHtml(String url) {
		if (StringUtils.isBlank(url)) {
			return new Html("");
		}
		try {
			return new Html(Http.get(url).getContent("utf-8"));
		} catch (Exception e) {
			LogUtils.spider.error(e.toString());
		}
		return new Html("");
	}
	
	public void destory() {
		hrefs.clear();
		url2Tag.clear();
		url2Img.clear();
	}
	
	public Class<? extends PageProcessor> getTaskClass() {
		return getClass();
	}

	public class MainData {
		private String url;
		private String image;

		public MainData(String url, String image) {
			super();
			this.url = url;
			this.image = image;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}
	}
	
	//----------------------------------------------------------------//
	
	protected String clearStr(String str, String regex, String replace) {
		return StrUtils.clearStr(str, regex, replace);
	}

	protected StringBuffer appendImage(String image) {
		if (StringUtils.isNotBlank(image)) {
			return new StringBuffer().append("<p><img src=").append('"').append(image).append('"').append(" width=").append('"').append("100%").append('"').append("></p>");
		} else {
			return new StringBuffer();
		}
	}

	protected String clearIframe(String content) {
		return clearStr(content, "<iframe ((.|\n)+?)</iframe>", "");
	}

	protected String clearScript(String content) {
		return clearStr(content, "<script ((.|\n)+?)</script>", "");
	}

	protected String clearScriptText(String content) {
		return clearStr(content, "<script>.*?</script>", "");
	}

	protected String fixdWH(String content) {
		content = clearStr(content, "height=\"([0-9]*)\"", "");
		content = clearStr(content, "width=\"([0-9]*)\"", "width=\"100%\"");
		return content;
	}

	protected String fixdWHStr(String content) {
		content = clearStr(content, "height=\".*?\"", "");
		content = clearStr(content, "width=\".*?\"", "width=\"100%\"");
		return content;
	}

	protected String clearClass(String content) {
		content = clearStr(content, " class=\"((.|\n)+?)\"", "");
		return content;
	}

	protected String clearIns(String content) {
		content = clearStr(content, "<ins(.*?)>", "");
		content = clearStr(content, "</ins>", "");
		return content;
	}

	protected String clearEm(String content) {
		content = clearStr(content, "<em(.*?)>", "");
		content = clearStr(content, "</em>", "");
		return content;
	}

	protected String clearFigure(String content) {
		content = clearStr(content, "<figure(.*?)>", "");
		content = clearStr(content, "</figure>", "");
		return content;
	}

	protected String clearStyleOnly(String content) {
		content = clearStr(content, " style=\"((.|\n)+?)\"", "");
		return content;
	}

	protected String clearFigcaption(String content) {
		return clearStr(content, "<figcaption.*?</figcaption>", "");
	}

	protected String clearNote(String content) {
		return clearStr(content, "<!--.*?-->", "");
	}

	protected String clearNoscript(String content) {
		return clearStr(content, "<noscript>.*?</noscript>", "");
	}

	protected String clearStyle(String content) {
		return clearStr(content, "<style>.*?</style>", "");
	}

	protected String clearStyleAll(String content) {
		return clearStr(content, "<style(.*?)>.*?</style>", "");
	}

	protected String searchStr(String str, String regex) {
		Pattern p = Pattern.compile(regex, Pattern.MULTILINE | Pattern.DOTALL);
		Matcher m = p.matcher(str);
		if (m.find()) {
			return m.group(0);
		}
		return "";
	}

	protected String clearAhref(String str) {
		str = clearStr(str, "<a .*?href=\"(.*?)\">(.*?)", "");
		str = clearStr(str, "</a>", "");
		return str;
	}

	protected String clearAhrefText(String str) {
		str = clearStr(str, "<a .*?href=\"(.*?)\">(.*?)</a>", "");
		return str;
	}

	protected String clearAhrefInside(String str) {
		str = clearStr(str, "<a .*?href=\"(.*?)\">", "");
		str = clearStr(str, "</a>", "");
		return str;
	}

	protected String clearHR(String str) {
		str = clearStr(str, "<hr(.*?)>", "");
		str = clearStr(str, "</hr>", "");
		return str;
	}

	protected String clearBlockquote(String str) {
		str = clearStr(str, "<blockquote(.*?)>.*?</blockquote>", "");
		return str;
	}

	protected String clearDiv(String str) {
		str = clearStr(str, "<div(.*?)>", "");
		str = clearStr(str, "</div>", "");
		return str;
	}

	protected String clearHeader(String str) {
		str = clearStr(str, "<header(.*?)>", "");
		str = clearStr(str, "</header>", "");
		return str;
	}

	protected String clearSpan(String str) {
		str = clearStr(str, "<span(.*?)>", "");
		str = clearStr(str, "</span>", "");
		return str;
	}

	protected String clearB(String str) {
		str = clearStr(str, "<b(.*?)>", "");
		str = clearStr(str, "</b>", "");
		return str;
	}

	protected String clearStrong(String str) {
		str = clearStr(str, "<strong(.*?)>", "");
		str = clearStr(str, "</strong>", "");
		return str;
	}

	protected String clearSpanText(String str) {
		str = clearStr(str, "<span>(?!<img .*?>)</span>", "");
		return str;
	}
	
	protected String clearTable(String str) {
		str = clearStr(str, "<table(.*?)>", "");
		str = clearStr(str, "</table>", "");
		return str;
	}

	protected String clearSection(String str) {
		str = clearStr(str, "<section(.*?)>", "");
		str = clearStr(str, "</section>", "");
		return str;
	}
	
	protected String clearTbody(String str) {
		str = clearStr(str, "<tbody(.*?)>", "");
		str = clearStr(str, "</tbody>", "");
		return str;
	}

	/***
	 * delete CRLF; delete empty line ;delete blank lines
	 * 
	 * @param input
	 * @return
	 */
	private static String deleteCRLFOnce(String input) {
		if (StringUtils.isNotBlank(input)) {
			return input.replaceAll("((\r\n)|\n)[\\s\t ]*(\\1)+", "$1").replaceAll("^((\r\n)|\n)", "");
		} else {
			return "";
		}
	}

	/***
	 * Delete all spaces
	 * 
	 * @param input
	 * @return
	 */
	public static String deleteAllCRLF(String input) {
		if (StringUtils.isBlank(input)) {
			return "";
		}
		return input.replaceAll("((\r\n)|\n)[\\s\t ]*", "").replaceAll("^((\r\n)|\n)", "");
	}

	public static String CRLF2Blank(String input) {
		return input.replaceAll("((\r\n)|\n)[\\s\t ]*", " ").replaceAll("^((\r\n)|\n)", " ").replaceAll("[ ]{2,}", " ");// 注意:replace不支持正则表达式
	}

	/**
	 * delete CRLF; delete empty line ;delete blank lines
	 * 
	 * @param input
	 * @return
	 */
	public static String deleteCRLF(String input) {
		return deleteCRLFOnce(input);
	}

	/**
	 * 过滤制定规则
	 * 
	 * @param str
	 * @param regex
	 *            <div class=\"share-bar\">.+?</div>
	 * @return
	 */
	public String searchFilter(String str, String regex) {
		Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE | Pattern.DOTALL);
		Matcher matcher = pattern.matcher(str);
		if (matcher.find()) {
			return matcher.group();
		}
		return str;
	}

	protected String appendWidthImg(String content) {
		Html imgHtml = new Html(content);
		List<Selectable> nodes = imgHtml.xpath("//img").nodes();
		Map<String, String> imgRepliceMap = new HashMap<>();
		for (Selectable node : nodes) {
			String imgSrc = node.get();
			if (StringUtils.contains(imgSrc, "width=") || StringUtils.contains(imgSrc, "width =")) {
				continue;
			}
			imgRepliceMap.put(imgSrc, StringUtils.removeEnd(imgSrc, ">") + " width=\"100%\">");
		}
		Iterator<Entry<String, String>> iterator = imgRepliceMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, String> entry = iterator.next();
			content = StringUtils.replace(content, entry.getKey(), entry.getValue());
		}
		return content;
	}

	protected String appendHostWidthImg(String content, String host) {
		Html imgHtml = new Html(content);
		List<Selectable> nodes = imgHtml.xpath("//img").nodes();
		Map<String, String> imgRepliceMap = new HashMap<>();
		for (Selectable node : nodes) {
			String imgSrc = node.xpath("//img/@src").get();
			if (StringUtils.contains(imgSrc, "http://") || StringUtils.contains(imgSrc, "https://")) {
				continue;
			}
			imgRepliceMap.put(imgSrc, host + imgSrc);
		}
		Iterator<Entry<String, String>> iterator = imgRepliceMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, String> entry = iterator.next();
			content = StringUtils.replace(content, entry.getKey(), entry.getValue());
		}
		return content;
	}
	
	private String clearContent(String content) {
		if (StringUtils.isBlank(content)) {
			return "";
		}
		return content;
	}
	
	public void writeHtml(String title,String content, String time) {
		try {
			StringBuffer buffer = new StringBuffer();
			buffer.append("");

			String editer = ".ran";
			//模板路径
			String filePath = "demo.html";
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			String file =  classLoader.getResource(filePath).getPath();

			String templateContent = "";
			FileInputStream fileinputstream = new FileInputStream(file);// 读取模板文件
			int lenght = fileinputstream.available();
			byte bytes[] = new byte[lenght];
			fileinputstream.read(bytes);
			fileinputstream.close();
			templateContent = new String(bytes);

			templateContent = templateContent.replaceAll("###title###", title);
			templateContent = templateContent.replaceAll("###content###",content);
			templateContent = templateContent.replaceAll("###time###",time);
			templateContent = templateContent.replaceAll("###author###", editer);// 替换掉模板中相应的地方

			// 根据时间得文件名
			String fileame = domain() + SPLIT + TimeUtils.getTimeSpecial()+ ".html";		
			fileame = "/" + fileame;
			// 生成的HTML文件保存路径
			FileOutputStream fileoutputstream = new FileOutputStream(fileame);// 建立文件输出流

			byte tag_bytes[] = templateContent.getBytes();
			fileoutputstream.write(tag_bytes);
			fileoutputstream.close();
		} catch (Exception e) {
			LogUtils.spider.error(" write file error , %s", e);
		}
		
	}
}
