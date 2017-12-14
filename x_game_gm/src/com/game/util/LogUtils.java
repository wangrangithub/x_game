package com.game.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** 
 * 
 */  
public class LogUtils {  
	

	/** quartz相关日志 */
	public static final Logger job = getLogger("game.controller.job");
	/** controller相关日志 */
	public static final Logger controller = getLogger("game.controller");
	/** Server相关的日志 */
	public static final Logger server = getLogger("game.server");
	/** DAO相关的日志 */
	public static final Logger dao = getLogger("game.dao");
	/** 模板相关的日志 */
	public static final Logger template = LoggerFactory.getLogger("game.template");
	/** 爬虫相关的日志 */
	public static final Logger spider = LoggerFactory.getLogger("game.controller.spider");
	/** 测试用相关的日志 */
	public static final Logger test = LoggerFactory.getLogger("game");

	/**
	 * 类默认构造器
	 */
	private LogUtils() {
	}

	/**
	 * 获取日志对象
	 * @param name
	 */
	private static Logger getLogger(String name) {
		// 断言参数不为空
		// 获取日志
		return LoggerFactory.getLogger(name);
	}
  
}  