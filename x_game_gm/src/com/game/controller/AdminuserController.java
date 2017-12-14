package com.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.game.bean.SimpleResult;
import com.game.constants.ResourceKeys;
import com.game.entity.Adminuser;
import com.game.entity.Roleinfo;
import com.game.service.AdminuserService;
import com.game.service.RoleinfoService;
import com.game.util.PageUtil;


@Controller
@Scope("request")
@RequestMapping("/adminuser")
public class AdminuserController {

	@Autowired
	private AdminuserService adminuserService;
	@Autowired
	private RoleinfoService roleinfoService;
	/**
	 * 员工列表
	 * @param model
	 * @param adminname
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(Model model,String adminname,@RequestParam(defaultValue="1", required=false) Integer pageIndex, @RequestParam(defaultValue=ResourceKeys.DEFAULT_PAGE_SIZE) Integer pageSize){
		PageUtil<Adminuser> pageModel= adminuserService.getRoleinfoWithPaging(adminname,pageIndex,pageSize);
		model.addAttribute("pageModel", pageModel);
		return "back/adminuser/list";
	}
	
	/**
	 * 新增员工
	 * @return
	 */
	@RequestMapping(value="/add.do",method=RequestMethod.GET)
	public String add(Model model){
		
		List<Roleinfo> roleList =  roleinfoService.getAllRoleinfoList();
		model.addAttribute("roleList", roleList);
		return "back/adminuser/add";
	}
	
	@ResponseBody
	@RequestMapping(value="/add.do",method=RequestMethod.POST)
	public SimpleResult add(@Validated Adminuser adminuser,BindingResult result){
		SimpleResult reResult=new SimpleResult();
		if(result.hasFieldErrors()){
			
			reResult.handlerError(result.getFieldErrors());
		}else{
			
			adminuserService.insertAdminuser(adminuser);
		}
		return reResult;
	}
	
	/**
	 * 删除员工账户
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteEmp.do")
	public String delete(Integer id){
		
		adminuserService.deleteEmpById(id);
		return "redirect:list.do";
	}
	
	/**
	 * 修改员工账户信息
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/update.do",method=RequestMethod.GET)
	public String update(Model model,Integer id){
		Adminuser user = adminuserService.getAdminuserById(id);
		model.addAttribute("adminuser", user);
		List<Roleinfo> roleList =  roleinfoService.getAllRoleinfoList();
		model.addAttribute("roleList", roleList);
		return "back/adminuser/update";
	}
	
	@ResponseBody
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public SimpleResult update(Integer id,@Validated Adminuser adminuser,BindingResult result){
		SimpleResult reResult = new SimpleResult();
		
		if(result.hasFieldErrors()){
			reResult.handlerError(result.getFieldErrors());
		}else{
			adminuserService.updateEmpById(adminuser);
		}
		
		return reResult;
		
	}
}
