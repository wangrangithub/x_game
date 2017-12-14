package com.game.util;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class PropertiesUtil {

	private static Properties props = new Properties();  

	public PropertiesUtil(String fileName){  
		readProperties(fileName);  
	}  
	private void readProperties(String fileName) {  
		try {  
			props = new Properties();  
			InputStream fis =getClass().getResourceAsStream(fileName);  
			props.load(fis);  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  
	}  
	/** 
	 * 获取某个属性 
	 */  
	public static String getProperty(String key){  
		return props.getProperty(key);  
	}  
	/** 
	 * 获取所有属性，返回一个map,不常用 
	 * 可以试试props.putAll(t) 
	 */  
	@SuppressWarnings("rawtypes")
	public Map<String,String> getAllProperty(){  
		Map<String,String> map=new HashMap<>();  
		Enumeration enu = props.propertyNames();  
		while (enu.hasMoreElements()) {  
			String key = (String) enu.nextElement();  
			String value = props.getProperty(key);  
			map.put(key, value);  
		}  
		return map;  
	}
}
