package com.game.spider.spiders;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.game.spider.AbstractSpider;
import com.game.spider.SpiderType;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.selector.Html;

public class SpiderTecents extends AbstractSpider{

	@Override
	public String domain() {
		return "Tecent";
	}

	@Override
	public void takeContent(Page page) {
		Html html = page.getHtml();
		String title = html.xpath("//h2[@class='xiaoshuomingkuang_biaoti']/text()").get();
		String content = html.xpath("//div[@class='xiaoshuomingkuang_neirong']").get();
		//String time = html.xpath("//span[@class='titer']/text()").get();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new Date());
		
		content = clearDiv(content);
		content = clearTable(content);
		content = clearAhref(content);
		content = clearTbody(content);
		//content = deleteAllCRLF(content);
		content = clearStr(content, "<tr>", "");
		content = clearStr(content, "</tr>", "");
		
		//写HTML文本
		writeHtml(title, content, time);
		
		putField(page, title, content, time);
	}

	@Override
	public List<MainData> takeHrefs(Page page) {
	/*	Html html = page.getHtml();
		List<Selectable> nodes = html.xpath("//div[@class='blk_tw clearfix']").nodes();
		for (Selectable node : nodes) {
			String url = node.xpath("//h3/a/@href").get();
			String img = node.xpath("//a/img/@src").get();
			if (Lang.isEmpty(img) && Lang.isEmpty(url)) {
				//同时为空，直接过
				continue ;
			}
			System.err.println("url = "+url);
			System.err.println("img = "+img);
			addMainData(url, img);
		}*/
		
		addMainData("https://huobiduihuan.51240.com/", "");
		return hrefs;
	}

	@Override
	public String[][] urls() {
		String[][] urls = new String[][] {
				{"https://huobiduihuan.51240.com/",SpiderType.type_demo.getIndex()}
				};
		return urls;
	}
	
	public static void main(String[] args) {
		new SpiderTecents().execute();
	}
}
