package com.game.common;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.util.Assert;

import com.game.appConfig.AppConfigBean;
import com.game.appConfig.AppConfigBuilder;
import com.game.appConfig.JdbcConfig;
import com.game.util.LogUtils;


public class CommDao {

	/** 单例对象 */
	public static final CommDao OBJ = new CommDao();
	/** 实体管理器工厂 */
	private EntityManagerFactory _emf = null;
	
	private CommDao() 
	{
		
	}
	
	/**
	 * 初始化DB配置信息
	 */
	public void initDbConfig()
	{
		AppConfigBean appConfigBean = AppConfigBuilder.OBJ.getAppConfigBean();
		if(appConfigBean==null)
		{
			throw new Error("应用配置参数appConfigBean为空");
		}
		
		//设置JDBC配置项
		Map<String,String> properties=new HashMap<String,String>();
		properties.put("javax.persistence.jdbc.url", JdbcConfig.getUrl());
		properties.put("javax.persistence.jdbc.user", JdbcConfig.getUsername());
		properties.put("javax.persistence.jdbc.password", JdbcConfig.getPassword());
		
		// 设置实体管理器工厂
		putEMFAndCreateTables(Persistence.createEntityManagerFactory("x_game_gm",properties));
		//建完表就不需要这个管理器工厂了
		//回收掉
		this._emf.close();
	}
	
	/**
	 * 设置实体管理器工厂
	 */
	private CommDao putEMFAndCreateTables(EntityManagerFactory value) 
	{
		//断言参数不为空
		Assert.notNull(value);

		if (this._emf != null) 
		{
			//throw new Error("重复设置实体管理器工厂");
			LogUtils.server.error("EntityManagerFactory already init");
			return this;
		}

		this._emf = value;
		return this;
	}
	
}
