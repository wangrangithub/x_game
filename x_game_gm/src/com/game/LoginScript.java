package com.game;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.nutz.lang.Lang;

import com.game.util.LogUtils;

public class LoginScript {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		updatepwd();
	}

	public static void login(){
		String loginUrl = "http://192.168.99.189:8080/x_game_gm/login.do";
		Map<String, String> params = new HashMap<>();
		params.put("username", "admin");
		params.put("userpass", "123456");
		httpPost(loginUrl, params);
	}

	public static void listAllUser(){
		String url = "http://192.168.99.189:8080/x_game_gm/jurisdiction/list.do";
		Map<String, String> params = new HashMap<>();
		String json = httpGet(url, params);
		System.err.println(json);
	}
	
	public static void updatepwd(){
		String url = "http://newcprice.jescard.com/startPic/detailList.json";
		Map<String, String> params = new HashMap<>();
		httpPost(url, params);
		System.err.println(httpPost(url, params));
	}



	/**
	 * post请求
	 * @param httpUrl	post地址
	 * @param params	参数
	 * @return
	 */
	public static String httpPost(String httpUrl, Map<String, String> params) {
		DataOutputStream dataOutputStream = null;  
		BufferedReader bufferedReader = null;  
		StringBuilder builder = new StringBuilder(); // 用来接受返回值  
		String result = null;
		try {
			URL url = new URL(httpUrl);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			// 设置post方法，默认是get方法  
			connection.setRequestMethod("POST"); 
			// post请求不能使用缓存  
			connection.setUseCaches(false); 
			// 配置本次连接的Content-type，配置为application/x-www-form-urlencoded的意思是正文是urlencoded编码过的form参数，下面我们可以看到我们对正文内容使用URLEncoder.encode进行编码  
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");  
			// 发送POST请求必须设置如下两行  
			connection.setDoOutput(true); 
			// 设置是否向connection输出，因为这个是post请求，参数要放在http正文内，因此需要设为true  
			connection.setDoInput(true); 
			connection.connect();

			// 获取URLConnection对象对应的输出流  
			dataOutputStream = new DataOutputStream(connection.getOutputStream());  
			// 发送请求参数，writeBytes将字符串中的16位的unicode字符以8位的字符形式写道流里面  
			dataOutputStream.writeBytes(transferParams(params));  
			//  刷新对象输出流，将任何字节都写入潜在的流中  
			dataOutputStream.flush();  
			// 定义BufferedReader输入流来读取URL的响应  
			bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8")); // 设置编码，否则中文乱码  
			String line;  
			while (null != (line = bufferedReader.readLine())) {  
				builder.append(line);  
			}  
			connection.disconnect(); // 断开连接  
			return builder.toString();  
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String httpGet(String httpUrl, Map<String, String> params){
		BufferedReader reader = null;
		String result = null;
		StringBuffer buffer = new StringBuffer();
		httpUrl = httpUrl + "?" + transferParams(params);

		try {
			URL url = new URL(httpUrl);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setRequestMethod("GET");
			connection.connect();
			
			InputStream is = connection.getInputStream();
			reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String strRead = null;
			while ((strRead = reader.readLine()) != null) {
				buffer.append(strRead);
				buffer.append("\r\n");
			}
			reader.close();
			result = buffer.toString();
		} catch (Exception e) {
			LogUtils.test.error("http GET error -->" + e);
		}
		return result;
	}

	public static String transferParams(Map<String, String> params){
		String paramsArgs = "";
		if (Lang.isEmpty(params)) {
			return paramsArgs;
		}

		try {
			StringBuffer buffer = new StringBuffer();  
			for (String param : params.keySet()) {
				buffer.append(URLEncoder.encode(param, "UTF-8")).append("=")  
				.append(URLEncoder.encode(params.get(param), "UTF-8")).append("&");
			}
			paramsArgs = buffer.toString();  
			if (paramsArgs.endsWith("&")) {  
				paramsArgs = StringUtils.substringBeforeLast(paramsArgs, "&");  
			}  
			return paramsArgs;
		} catch (Exception e) {
			LogUtils.test.error(" transfer error --> "+e);
		}
		return paramsArgs; 
	}
}


