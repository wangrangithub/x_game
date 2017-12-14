package com.game.logserver.test;

import java.net.URI;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.ws.rs.core.UriBuilder;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyWebTarget;

import com.game.logserver.MyLog;
import com.game.logserver.logobjs.AbstractLog;
import com.game.logserver.servlet.ILogAPI;

public class LogService {
	
	/** 单例对象 */
	public static final LogService OBJ = new LogService();

	/** 游戏区ID */
	private int regionID;
	/** 游戏服务器ID */
	private int serverID;

	/** log日志服务器resetful 接口地址 */
	private String logServerUrl;

	/** 多线程线程池 */
	private static volatile ExecutorService _exec = null;

	private static URI uri = null;

	ResteasyClient client = null;

	// 设置代理
	ILogAPI api = null;

	/**
	 * 类默认构造器
	 * 
	 */
	private LogService() {
	}

	/**
	 * 设置日志服务器地址
	 * @param value
	 * @return
	 */
	public LogService putLogServerUrl(String value) {
		this.logServerUrl = value;
		//设置日志服务器地址
		uri = UriBuilder.fromUri(logServerUrl).build();
		return this;
	}
	
	public LogService buildThread(){
		//构建线程池
		if (_exec == null) {
			synchronized (LogService.class) {
				if (_exec == null) {
					_exec = Executors.newSingleThreadExecutor();
				}
			}
		}
		return this;
	}
	
	/**
	 * 发送日志
	 * @param uid
	 * @param log
	 */
	public void sendLog(long uid , AbstractLog log){
		sendLogs(log, regionID, serverID);
	}
	
	private void sendLogs(final AbstractLog logObj, final int regionID, final int serverID){
		if (StringUtils.isEmpty(logServerUrl)) {
			//日志服务器地址为空
			//直接退出
			return ;
		}

		if (logObj.getLogTime() == null || logObj.getLogTime() <= 0) {
			logObj.setLogTime(System.currentTimeMillis()) ;
		}

		_exec.execute(new Runnable() {
			@Override
			public void run() {
				// 定义 HTTP 客户端
				if (client == null || client.isClosed()) {
					// 如果已经关闭，重新打开一个连接
					client = (new ResteasyClientBuilder()).connectionTTL(20, TimeUnit.SECONDS).build();
					// 构建 URL 目标
					ResteasyWebTarget target = client.target(uri);

					api = target.proxy(ILogAPI.class);
				}

				try {
					//获取json字符串
					ObjectMapper _mapper = new ObjectMapper();
					String jsonText = _mapper.writeValueAsString(logObj);

					//获取类名
					String clazzName = logObj.getClass().getName();

					//发送日志
					api.sendLog(regionID, serverID, clazzName, jsonText);

				} catch (Exception e) {
					MyLog.OBJ.error("send log error : " + e);
				}
			}
		});
	}
	
	public <T extends AbstractLog> T buildLogObj(long uid, T log, ILogReasons logReason,String params){
		if (log == null || uid <= 0) {
			// 如果参数对象为空,
			// 则直接退出!
			return log;
		}
		
		//TODO 
		log.setId(uid);
		
		return log;
	}
	
}
