package com.game.appConfig;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.game.util.LogUtils;


/**
 * 程序全局配制项
 * 
 * @author Thinker
 */
public class AppConfigBuilder
{
	public final static AppConfigBuilder OBJ = new AppConfigBuilder();
	/**程序应用配置bean*/
	private static AppConfigBean appConfigBean = new AppConfigBean();

	private AppConfigBuilder()
	{
		
	}

	/**
	 * 解析 xx.properties文件
	 * @param url
	 * @throws Exception
	 */
	public void build(URL url) throws Exception
	{
		Properties prop = new Properties();
		Reader re = null;
		InputStream is = null;
		
		try 
		{
			is = url.openStream();
			re = new InputStreamReader(is, "UTF-8");
			prop.load(re);
			
			// 初始化appConfigBean
			parse2AppConfigBean(prop);
		} finally
		{
			if (re != null) 
			{
				re.close();
				re = null;
			}

			if (is != null) 
			{
				is.close();
				is = null;
			}
		}
	}

	/**
	 * 初始化appConfigBean
	 * @param prop
	 */
	private void parse2AppConfigBean(Properties prop) 
	{
		Method[] methods = AppConfigBean.class.getMethods();
		// 整理方法和名字的对应
		Map<String, Method> methodMap = new HashMap<String, Method>();
		String methodName;
		String fritsChar;
		for (Method method : methods) 
		{
			methodName = method.getName();
			if (methodName.startsWith("set")) 
			{
				// 除去set
				methodName = methodName.substring(3);
				// 将第一个字符变成小写
				fritsChar = methodName.substring(0, 1);
				fritsChar = fritsChar.toLowerCase();
				// 保存映射
				methodName = fritsChar + methodName.substring(1);
				methodMap.put(methodName, method);
			}
		}

		// 初始化参数
		Enumeration<Object> keys = prop.keys();
		String key;
		Method method;
		while (keys.hasMoreElements()) 
		{
			key = (String) keys.nextElement();
			if (!methodMap.containsKey(key))
			{
				continue;
			}
			
			method = methodMap.get(key);
			invokeSetMethod(method,prop,key);
		}
	}
	
	/**
	 * 发射设置方法
	 * @param method
	 * @param prop
	 * @param key
	 */
	private void invokeSetMethod(Method method,Properties prop,String key)
	{
		try 
		{
			Class<?>[] paramTypes = method.getParameterTypes();
			String paramTypeName = paramTypes[0].getName();
			if (paramTypeName.indexOf("String") != -1) 
			{
				method.invoke(AppConfigBuilder.appConfigBean, prop.get(key));
			} else if (paramTypeName.indexOf("int") != -1) 
			{
				method.invoke(AppConfigBuilder.appConfigBean,Integer.parseInt(String.valueOf(prop.get(key))));
			} else if (paramTypeName.indexOf("long") != -1) 
			{
				method.invoke(AppConfigBuilder.appConfigBean,Long.parseLong(String.valueOf(prop.get(key))));
			} else if (paramTypeName.indexOf("double") != -1) 
			{
				method.invoke(AppConfigBuilder.appConfigBean,Double.parseDouble(String.valueOf(prop.get(key))));
			} else if (paramTypeName.indexOf("float") != -1) 
			{
				method.invoke(AppConfigBuilder.appConfigBean,Float.parseFloat(String.valueOf(prop.get(key))));
			} else if (paramTypeName.indexOf("boolean") != -1) 
			{
				method.invoke(AppConfigBuilder.appConfigBean,Boolean.parseBoolean(String.valueOf(prop.get(key))));
			}else
			{
				throw new Exception("Unsuport This Class Type:"+ paramTypes[0].getName());
			}
		} catch (Exception e) 
		{
			LogUtils.server.error(e.getMessage(), e);
			throw new Error(e);
		}
	}
	
	/**
	 * 获取应用程序的全局配制bean
	 */
	public AppConfigBean getAppConfigBean() 
	{
		return appConfigBean;
	}
	/**
	 * 当前应用路径
	 * @param currentPath
	 */
	public void setCurrentPath(String currentPath)
	{
		appConfigBean.setCurrentPath(currentPath);
	}
	
	
	/**
	 * 当前应用路径
	 */
	public String getCurrentPath()
	{
		return appConfigBean.getCurrentPath();
	}
	
	
}
