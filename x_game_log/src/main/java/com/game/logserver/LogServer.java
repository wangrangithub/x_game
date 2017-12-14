package com.game.logserver;

import java.util.Arrays;
import java.util.List;
import java.util.Timer;
import java.util.concurrent.SynchronousQueue;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.PropertyConfigurator;
import org.jboss.resteasy.plugins.server.netty.NettyJaxrsServer;
import org.jboss.resteasy.spi.ResteasyDeployment;

import com.game.logserver.appconfig.AppConfig;
import com.game.logserver.servlet.LogServlet;
import com.game.logserver.timer.CommitLogTask;

public class LogServer {
	
	/** 服务器 IP 地址 */
	private String _serverIP = "127.0.0.1";
	/** 服务器端口 */
	private int _port = 8003;
	/** Netty */
	private NettyJaxrsServer _netty;
	
	public static LogServer theApp;

	/** 停服命令队列 */
	private final SynchronousQueue<Boolean> _stopQ = new SynchronousQueue<>();
	
	/**
	 * 默认构造
	 * @param serverIP
	 * @param port
	 */
	public LogServer (String serverIP , int port){
		if (StringUtils.isEmpty(serverIP)) {
			//如果服务器IP为空
			//直接抛出异常
			throw new IllegalArgumentException(" serverIP is null ");
		}
		this._serverIP = serverIP;
		this._port = port;
	}
	
	public static void main(String[] args) throws Exception {
		// 获取应用程序根目录
		String rootDir = getRootDir();
		
		//生成auto.xml
		MyBatisSQLMapGen.OBJ.gen(rootDir + "/sqls/auto.xml");
		
		//设置log4j配置
		PropertyConfigurator.configure(rootDir + "/config/log4j.properties");
		
		//加载配置文件
		AppConfig.loadProps(rootDir + "/config/configs.properties");
		
		//测试一发
		CommonDAO.OBJ.sayHello();
		
		//设置sql提交条数
		CommonDAO.COMMIT_COUNT = AppConfig.getSqlCommit();
		
		LogServer app = null;
		
		//创建并启动服务器
		app = new LogServer(AppConfig.getServerIp(), AppConfig.getServerPort());
		app.start();
		
		LogServer.theApp = app;
		
		//写出监控文件
		theApp.writeOutAndMonitorProcFile();
		
		//启动定时器,定时插入日志数据
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(
				new CommitLogTask(), 
				1000 * 60 * AppConfig.getCommitTime(), 
				1000 * 60 * AppConfig.getCommitTime());
		
		while (Boolean.TRUE.equals(theApp._stopQ.take())) {
			MyLog.OBJ.info("停服执行");
			theApp.stop();
		}
	}
	
	private static String getRootDir(){
		return LogServer.class.getClassLoader().getResource("./").getPath();
	}
	
	public void start(){
		ResteasyDeployment deployment = new ResteasyDeployment();
		deployment.setSecurityEnabled(true);
		// 注册命令类
		this.registerCmdClazz(deployment);

		_netty = new NettyJaxrsServer();
		_netty.setDeployment(deployment);
		_netty.setPort(_port);
		_netty.setRootResourcePath(_serverIP);
		_netty.setSecurityDomain(null);
		_netty.setKeepAlive(true);
		_netty.start();
		_netty.getDeployment();
	}
	
	public void stop(){
		CommonDAO.OBJ.commitAllLogs();
		
		if (_netty == null) {
			return;
		}
		
		_netty.stop();
		
		System.exit(0);
	}
	
	/**
	 * 注册命令类
	 * 
	 * @param deployment
	 * 
	 */
	private void registerCmdClazz(ResteasyDeployment deployment) {
		if (deployment == null) {
			return;
		}

		// 创建注册类列表
		List<String> resList = Arrays.asList(
				LogServlet.class.getName()
				);
		deployment.setResourceClasses(resList);
	}
	
	private void writeOutAndMonitorProcFile(){
		
	}
}
