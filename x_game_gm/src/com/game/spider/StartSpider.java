package com.game.spider;

import java.util.HashMap;

import org.nutz.lang.Lang;


public class StartSpider {
	
	//单例对象
	public static final StartSpider OBJ = new StartSpider();
	
	public static int BASE = 1;
	
	private static HashMap<Integer, AbstractSpider> _spiderMap = new HashMap<>();
	
	public void excute(){
		if (Lang.isEmpty(_spiderMap)) {
			this.regSpiders();
		}
		
		if (Lang.isEmpty(_spiderMap)) {
			return;
		}
		
		for (Integer key : _spiderMap.keySet()) {
			AbstractSpider spider = _spiderMap.get(key);
			if (spider == null) {
				continue;
			}
			//执行一发
			spider.execute();
		}
	}
	
	/**
	 * 注册小蜘蛛
	 * @param clazz
	 * @param spider
	 */
	public void regSpiders(){
	}
}
