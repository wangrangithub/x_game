package com.game.controller;

import java.net.URL;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;

import com.game.appConfig.AppConfig;
import com.game.appConfig.AppConfigBuilder;
import com.game.appConfig.JdbcConfig;
import com.game.common.CommDao;
import com.game.util.LogUtils;

/**
 * 容器启动时加载</br>
 * </br>
 * 功能包涵   启动时需要干的事...
 * 
 * @author User
 *
 */
@Controller
public class ServerInitController {

	private final static String jdbcProperties = "jdbc.properties";
	private final static String configProperties = "configs.properties";
	
	@PostConstruct
	public void init(){
		try {
			//加载配置文件
			loadAppConfig(jdbcProperties);
			
			//加载配置文件
			JdbcConfig.loadProps(getUrl(jdbcProperties).getPath());
			AppConfig.loadProps(getUrl(configProperties).getPath());
			
			//JPA自动建表
			CommDao.OBJ.initDbConfig();
			
		} catch (Exception e) {
			LogUtils.server.error("Load Config Error : "+e);
			e.printStackTrace();
		}
	}
	
	/**
	 * 加载配置文件
	 * @throws Exception
	 */
	public void loadAppConfig(String fileName) throws Exception{
		String curPath = this.getClass().getResource("/").getPath();
		curPath = curPath.substring(0, curPath.lastIndexOf("/"));
		//设置应用当前路径
		AppConfigBuilder.OBJ.setCurrentPath(curPath);
		//配置文件初始化
		URL url = getUrl(fileName);
		AppConfigBuilder.OBJ.build(url); 
	}
	
	/**
	 * 获取文件目录
	 * @param fileName
	 * @return
	 */
	public URL getUrl(String fileName){
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		return classLoader.getResource(fileName);
	}
}
