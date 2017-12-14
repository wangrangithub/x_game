package com.game.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor implements HandlerInterceptor {

	/*
	 * 1.preHandle 2.页面控制器 3.postHandle 4.渲染视图 5.afterCompletion
	 * 
	 */

	/**
	 * 页面控制器执行之后，视图渲染之后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	/**
	 * 在页面控制器执行之后，视图被渲染之前调用
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	/**
	 * 在页面控制器执行之前调用 如果方法返回false，那么不再执行页面控制器中的代码
	 * 
	 * handler：被拦截的页面控制器
	 * 
	 */
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {

		// 判断是否登录
		if (req.getSession().getAttribute("USER") != null) {
			if (resp.getStatus() == 500) {
				return false;
			}
			
			return true;
		} else {

			resp.sendRedirect(req.getContextPath() + "/login.do");
			return false;
		}
		
	}

}
