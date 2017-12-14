package com.game.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.game.bean.SimpleResult;
import com.game.constants.ResourceKeys;
import com.game.entity.Adminuser;
import com.game.entity.Functionmenu;
import com.game.entity.Roleinfo;
import com.game.service.AdminuserService;
import com.game.service.FunctionmenuService;
import com.game.service.JurisdictionService;
import com.game.util.NodelTree;
import com.game.util.PageUtil;

@Controller
@Scope("request")
@RequestMapping("/jurisdiction")
public class JurisdictionController {

	// 权限管理
	@Autowired
	private JurisdictionService jurisdictionService;
	@Autowired
	private FunctionmenuService functionmenuService;
	@Autowired
	private AdminuserService adminuserService;

	/**
	 * 权限列表
	 * 
	 * @param model
	 * @param rolename
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/list.do")
	public String roleList(Model model, String rolename,
			@RequestParam(defaultValue = "1", required = false) Integer pageIndex,
			@RequestParam(defaultValue = ResourceKeys.DEFAULT_PAGE_SIZE) Integer pageSize) {
		PageUtil<Roleinfo> pageModel = jurisdictionService.getRoleinfoWithPaging(rolename, pageIndex, pageSize);
		model.addAttribute("pageModel", pageModel);

		return "back/jurisdiction/list";
	}

	/**
	 * 权限添加角色
	 */
	@RequestMapping(value = "/add.do", method = RequestMethod.GET)
	public String add(Model model) {
		List<Functionmenu> functList = functionmenuService.getAllfunctionmenu();
		model.addAttribute("menus", functList);
		return "back/jurisdiction/add";
	}

	@ResponseBody
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public SimpleResult add(Model model, @Validated Roleinfo roleinfo, BindingResult result, Integer[] funids) {
		SimpleResult srResult = new SimpleResult();

		if (result.hasFieldErrors()) {

			srResult.handlerError(result.getFieldErrors());
		} else {

			jurisdictionService.insertRoleinfo(roleinfo, funids);
		}

		return srResult;

	}

	/**
	 * 修改该角色的权限
	 */
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String update(Integer id, Model model) {
		Roleinfo role = jurisdictionService.getJurisdictionById(id);

		model.addAttribute("role", role);
		return "back/jurisdiction/update";
	}

	@ResponseBody
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public SimpleResult update(@Validated Roleinfo roleinfo, BindingResult result, Integer[] funids) {

		SimpleResult srResult = new SimpleResult();

		if (result.hasFieldErrors()) {

			srResult.handlerError(result.getFieldErrors());
		} else {

			jurisdictionService.updateRoleinfo(roleinfo, funids);
		}

		return srResult;
	}

	/**
	 * 修改回显权限树
	 * 
	 * @param id
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updatetree.json", method = RequestMethod.GET)
	public List<NodelTree> updatetree(Integer id, HttpServletResponse resp) throws Exception {
		List<Functionmenu> functList = functionmenuService.getAllfunctionmenu();
		Integer[] rfs = jurisdictionService.getfunctionmenuByFuntId(id);

		for (Functionmenu fun : functList) {
			boolean contains = false;
			for (Integer funid : rfs) {

				if (fun.getParentfunid() == null || fun.getParentfunid() == 0) {
					continue;
				}
				int pid = fun.getFunid();
				int nid = funid;

				if (pid == nid) {
					contains = true;
					break;
				}
			}
			fun.setChecked(contains);

		}

		nodes = new ArrayList<NodelTree>();

		for (Functionmenu fun : functList) {
			NodelTree nodetree = new NodelTree();
			if (fun.getParentfunid() == null || fun.getParentfunid() == 0) {

				nodetree.setChecked(fun.getChecked());
				nodetree.setId(fun.getFunid());
				nodetree.setText(fun.getFunname());
				nodes.add(nodetree);
			}

		}

		setMenu(functList, nodes, rfs);
		/*
		 * ObjectMapper mapper = new ObjectMapper(); String
		 * json=mapper.writeValueAsString(node); System.out.println(json);
		 * resp.getWriter().write(json);
		 */

		return nodes;

	}

	private void setMenu(List<Functionmenu> allMenu, List<NodelTree> parentNodes, Integer[] rfs) {

		// 根据用户角色ID查询所有的菜单
		for (NodelTree node : parentNodes) {
			for (Functionmenu fun : allMenu) {

				if (fun.getParentfunid() == null || node.getId() == null) {
					continue;
				}
				int pid = fun.getParentfunid();
				int nid = node.getId();

				if (pid == nid) {

					NodelTree child = new NodelTree();
					child.setId(fun.getFunid());
					child.setText(fun.getFunname());
					node.getChildren().add(child);
					child.setChecked(fun.getChecked());

				}
			}

			setMenu(allMenu, node.getChildren(), rfs);

			if (node.getChildren().size() > 0) {

				int checkedCount = 0;
				for (NodelTree node2 : node.getChildren()) {
					if (node2.isChecked()) {
						checkedCount++;
					}
				}

				if (checkedCount > 0 && checkedCount == node.getChildren().size()) {
					node.setChecked(true);
				} else {
					node.setChecked(false);
				}
			}
		}
	}

	/**
	 * 删除权限？判断该权限下是否有员工
	 * 
	 * @param id
	 * @param model
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String delete(Integer id, Model model, RedirectAttributes attr) {
		Integer count = adminuserService.checkExitEmpById(id);
		if (count == null) {
			jurisdictionService.deleteRoleinfoById(id);

		} else {

			attr.addFlashAttribute("error", "该角色有员工在使用！");
		}

		return "redirect:list.do";
	}

	/**
	 * 1，所需要进行控制的按钮列表 2，当前用户拥有的按钮列表
	 */
	@ResponseBody
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public List<Functionmenu> control(Model model, HttpSession session) {
		List<Functionmenu> functList = null;
		Adminuser adminUser = (Adminuser) session.getAttribute("USER");
		if (adminUser!=null) {
			functList = functionmenuService.getFunctionmenuByRoleid(adminUser.getRoleid());
		} 

		return functList;
	}

	/**
	 * 权限树
	 */
	List<NodelTree> nodes = null;

	@ResponseBody
	@RequestMapping(value = "/tree.json")
	public List<NodelTree> tree(HttpServletResponse resp) throws Exception {
		List<Functionmenu> functList = functionmenuService.getAllfunctionmenu();

		nodes = new ArrayList<NodelTree>();

		for (Functionmenu fun : functList) {
			if (fun.getParentfunid() == null) {

				NodelTree nodetree = new NodelTree();
				nodetree.setId(fun.getFunid());
				nodetree.setText(fun.getFunname());
				nodes.add(nodetree);
			}
		}
		setChildrenMenu(functList, nodes);
		return nodes;
	}

	private void setChildrenMenu(List<Functionmenu> allMenu, List<NodelTree> parentNodes) {
		// List<Functionmenu> functList
		// =functionmenuService.getAllfunctionmenu();
		for (NodelTree node : parentNodes) {
			if (node.getId() == 139) {
				// System.err.println("----------"+1);
			}
			for (Functionmenu fun : allMenu) {
				// System.err.println(fun.getParentfunid());
				if (fun.getParentfunid() == null || node.getId() == null) {
					continue;
				}
				int pid = fun.getParentfunid();
				int nid = node.getId();

				if (pid == nid) {

					NodelTree child = new NodelTree();
					child.setId(fun.getFunid());
					child.setText(fun.getFunname());
					node.getChildren().add(child);
				}
			}
			setChildrenMenu(allMenu, node.getChildren());
		}
	}
}
