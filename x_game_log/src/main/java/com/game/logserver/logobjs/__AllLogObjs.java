package com.game.logserver.logobjs;

import java.util.ArrayList;
import java.util.List;

/**
 * 所有的日志对象
 * 
 * @author hjj2017
 * @since 2013/7/21
 * 
 */
public final class __AllLogObjs {
	/** 日志类列表 */
	private static List<Class<? extends AbstractLog>> _cl = null;

	/**
	 * 类默认构造器
	 * 
	 */
	private __AllLogObjs() {
	}

	/**
	 * 获取所有的日志对象
	 * 
	 * @return
	 * 
	 */
	public synchronized static List<Class<? extends AbstractLog>> getAllClazz() {
		if (_cl != null) {
			return _cl;
		}

		// 创建类列表
		_cl = new ArrayList<>();

		// TODO 添加日志类
		_cl.add(Mytestlog.class);
		
		return _cl;
	}
}
