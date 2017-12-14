package com.game.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.game.entity.Adminuser;
import com.game.service.AdminuserService;
@Controller
@Scope("request")
public class LoginController {

	@Autowired
	private AdminuserService adminuserService;
	/*
	 * 用户登录
	 */
	@RequestMapping("/login.do")
	public String login(){
		
		return "login";
	}
	/**
	 * 判断用户登录
	 * @param username
	 * @param userpass
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(String username,String userpass,HttpSession session,Model model,String safeCode){
		Adminuser adminUser =adminuserService.checkExistUser(username,userpass);
		
		
		if(adminUser!=null){
			/*String sessionSafeCode = (String) session.getAttribute("certCode");
			if ("".equals(safeCode)) {
				model.addAttribute("fail", "请输入验证码！");
				return "login";
			}
			if (safeCode.equals(sessionSafeCode)) {
				session.setAttribute("USER", adminUser);
				return "redirect:homePage.do";
			} else{
				model.addAttribute("fail", "验证码输入错误！");
				return "login";
			}*/
			session.setAttribute("USER", adminUser);
			return "redirect:homePage.do";
		}else{
			model.addAttribute("fail", "账号或密码错误！");
			return "login";
		}
		
	}
	/**
	 * 清楚session中的用户信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		
		return "redirect:login.do";
	}
}
