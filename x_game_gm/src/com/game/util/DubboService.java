package com.game.util;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 提供dubbo服务
 * 
 * <b>使用gm可以通过rpc调用游戏服service<b>
 * 
 * @author Bill.Yang
 */
public class DubboService {
	/** 单例对象 **/
	public static final DubboService me = new DubboService();
	/** spring上下文 **/
	private ClassPathXmlApplicationContext context = null;
	private final static String providerConfig = "applicationContext-mybatis.xml";
	
	
	public DubboService() {
		loadRpcConfig();
	}

	/**
	 * 加载RPC服务
	 */
	protected void loadRpcConfig(){
		context = new ClassPathXmlApplicationContext(new String[] {providerConfig});
		context.start();
	}
	
	/**
	 * 通过引用id获取远程服务对象实例
	 * @param referenceId
	 * @return 返回远程服务对象实例
	 */
	public Object getRpcService(String referenceId){
		return context.getBean(referenceId);
	}
}
