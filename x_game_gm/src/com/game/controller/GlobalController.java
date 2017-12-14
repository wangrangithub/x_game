package com.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.game.entity.ServerEntity;
import com.game.service.ServerService;

/**
 * 服务器相关
 * @author User
 *
 */
@Controller
@Scope("request")
public class GlobalController {

	@Autowired
	private ServerService serverService;
	
	public void test() {
		ServerEntity entity = new ServerEntity();
		serverService.insertServer(entity);
	}
	
}
