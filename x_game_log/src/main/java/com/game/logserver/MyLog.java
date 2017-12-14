package com.game.logserver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 自定义日志类
 * 
 * @author hjj2019
 * @since 2013/7/11
 * 
 */
public final class MyLog {
	/** 创建日志对象 */
	public static final Logger OBJ = LoggerFactory.getLogger(MyLog.class);

	/**
	 * 类默认构造器
	 * 
	 */
	private MyLog() {
	}
}

