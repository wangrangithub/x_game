package com.game.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.game.entity.Adminuser;
import com.game.entity.Functionmenu;
import com.game.service.FunctionmenuService;


@Controller
@Scope("request")
public class HomePageController {

	@Autowired
	private FunctionmenuService functionmenuService;
	
	/**
	 * 登录成功首页后
	 * 获取该用户所拥有的权限
	 * @param model
	 * @return
	 */
	@RequestMapping("/homePage.do")
	public String homePage(Model model,HttpSession session){
		
		Adminuser adminUser =(Adminuser) session.getAttribute("USER");
		if(adminUser!=null){
			
			List<Functionmenu> funs = functionmenuService.getFunctionmenuByRoleid(adminUser.getRoleid());
			model.addAttribute("funs", funs);
			return "back/homePage2";
		}else{
			return "redirect:login.do";
		}
		
		
	}
	
}
