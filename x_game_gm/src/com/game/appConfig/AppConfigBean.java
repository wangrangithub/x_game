package com.game.appConfig;

/**
 * 应用程序配置项，在jdbc.properties文件中定义
 * 
 * @author Bill.Yang
 */
public class AppConfigBean {
	/***
	 * 当前应用的路径,程序自动读取并设置的
	 */
	private String currentPath;
	
	/**
	 * 数据库配置
	 */
	private String url;
	private String username;
	private String password;
	
	public String getCurrentPath() {
		return currentPath;
	}
	public void setCurrentPath(String currentPath) {
		this.currentPath = currentPath;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
