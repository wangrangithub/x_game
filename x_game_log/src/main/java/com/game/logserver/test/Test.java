package com.game.logserver.test;

import com.game.logserver.logobjs.Mytestlog;

public class Test {
	public static void main(String[] args) {
		send ();
	}
	
	public static void send (){
		String log_path = "http://127.0.0.1:8003";
		LogService service = LogService.OBJ.putLogServerUrl(log_path).buildThread();
		
		for (int i = 0; i < 2000; i++) {
			Mytestlog log = new Mytestlog();
			log.setAddEvo(i);
			service.sendLog(0, log);
		}
	}
}
