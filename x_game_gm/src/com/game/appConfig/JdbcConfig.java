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
public class JdbcConfig {
	
	/** 属性字典 */
	private static Properties _props = null;
	
	/** HTML保存地址 */
	private static final String JDBC_DIRVER = "datasource.driverClassName";
	/** HTML保存地址 */
	private static final String JDBC_URL = "datasource.url";
	/** HTML保存地址 */
	private static final String JDBC_USER_NAME = "datasource.username";
	/** HTML保存地址 */
	private static final String JDBC_PASSWORD = "datasource.password";
	
	public JdbcConfig() {
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
	public static String getDriver() {
		return _props.getProperty(JDBC_DIRVER);
	}
	
	public static String getUrl() {
		return _props.getProperty(JDBC_URL);
	}
	public static String getUsername() {
		return _props.getProperty(JDBC_USER_NAME);
	}
	
	public static String getPassword() {
		return _props.getProperty(JDBC_PASSWORD);
	}
}
