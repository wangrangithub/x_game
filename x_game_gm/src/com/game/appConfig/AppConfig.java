package com.game.appConfig;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * 应用程序配置项，在config.properties文件中定义
 * 
 * @author user
 */
public class AppConfig {
	
	/** 属性字典 */
	private static Properties _props = null;
	
	/** HTML保存地址 */
	private static final String PROPS_HTML_DIR = "config.htmlDir";
	
	/** 是否是调试模式 */
	private static final String PROPS_ISDEBUG = "config.debug";
	
	public AppConfig() {
	}
	
	/**
	 * 加载属性字典
	 * 
	 * @param fileName 
	 * 
	 */
	public static void loadProps(String fileName) {
		try {
			// 创建输入流
			InputStream input = new BufferedInputStream(new FileInputStream(fileName));
			// 创建属性对象
			_props = new Properties();
			_props.load(input);
		} catch (Exception ex) {
			// 抛出运行时异常
			throw new RuntimeException(ex);
		}
	}
	
	/**
	 * 获取属性字典
	 * 
	 * @return 
	 * 
	 */
	public static Properties getProps() {
		return _props;
	}
	
	/**
	 * 获取配置数据
	 * 
	 * @return 
	 * 
	 */
	public static String getHtmlDir() {
		return _props.getProperty(PROPS_HTML_DIR);
	}
	
	public static boolean isDebug() {
		return Boolean.parseBoolean(_props.getProperty(PROPS_ISDEBUG));
	}
}
