package com.game.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.game.constants.ResourceKeys;

@Controller
@Scope("request")
@RequestMapping("/gameServer")
public class GameServerController {
	
	// RPC接口
	// 调用游戏服接口
	//IGmService gmService = (IGmService) DubboService.me.getRpcService("gmService");
	/**
	 * 服务器列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/gameServer", method = RequestMethod.GET)
	public String nicksearch(Model model, @RequestParam(defaultValue = "1", required = false) Integer pageIndex,
			@RequestParam(defaultValue = ResourceKeys.DEFAULT_PAGE_SIZE) Integer pageSize) {
		return "back/gameServer/gameServer";
	}
	
}
