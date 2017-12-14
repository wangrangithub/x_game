package com.game.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.game.dao.RolefunmenurelMapper;
import com.game.dao.RoleinfoMapper;
import com.game.entity.Rolefunmenurel;
import com.game.entity.Roleinfo;
import com.game.service.JurisdictionService;
import com.game.util.PageUtil;
@Service
public class JurisdictionServiceImpl implements JurisdictionService{

	@Autowired
	private RoleinfoMapper roleDao;
	@Autowired
	private RolefunmenurelMapper rolefunmenurelDao;
	
	@Override
	public PageUtil<Roleinfo> getRoleinfoWithPaging(String rolename, Integer pageIndex, Integer pageSize) {
		PageUtil<Roleinfo> pageModel = new PageUtil<Roleinfo> (pageIndex,pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rolename", rolename);
		map.put("skip", (pageIndex-1)*pageSize);
		map.put("take", pageSize);
		List<Roleinfo> list=roleDao.getRoleinfoWithPaging(map);
		Long count = roleDao.getRoleinfoCount(rolename);
		pageModel.setDateList(list);
		pageModel.setTotalCount(count);
		return pageModel;
	}
	@Override
	public void insertRoleinfo(Roleinfo roleinfo, Integer[] funids) {
		// TODO Auto-generated method stub
		roleDao.insertRoleinfo(roleinfo);
		Integer roleid=roleDao.getRoleidByName(roleinfo.getRolename());
		List<Rolefunmenurel> list = new ArrayList<Rolefunmenurel>();
		for (Integer funId : funids) {

			Rolefunmenurel rolefunrel = new Rolefunmenurel();
			rolefunrel.setRoleid(roleid);
			rolefunrel.setFunid(funId);
			list.add(rolefunrel);
			//rolefunmenurelDao.addRolefunmenu(rolefunrel);
		}
		rolefunmenurelDao.addRolefunmenu(list);
	}
	@Override
	public void deleteRoleinfoById(Integer id) {
		// TODO Auto-generated method stub
		rolefunmenurelDao.deleteRoleFunByRoleid(id);
		
		roleDao.deleteRoleinfoById(id);
	}
	@Override
	public Roleinfo getJurisdictionById(Integer id) {
		// TODO Auto-generated method stub
		return roleDao.getJurisdictionById(id);
	}
	@Override
	public Integer[] getfunctionmenuByFuntId(Integer id) {
		// TODO Auto-generated method stub
		return rolefunmenurelDao.getfunctionmenuByFuntId(id);
	}
	@Override
	public void updateRoleinfo(Roleinfo roleinfo, Integer[] funids) {
		// TODO Auto-generated method stub
		roleDao.updateRoleinfo(roleinfo);
		rolefunmenurelDao.deleteFunByRoleid(roleinfo.getRoleid());
		List<Rolefunmenurel> list = new ArrayList<Rolefunmenurel>();
		for (Integer funId : funids) {

			Rolefunmenurel rolefunrel = new Rolefunmenurel();
			rolefunrel.setRoleid(roleinfo.getRoleid());
			rolefunrel.setFunid(funId);
			list.add(rolefunrel);
			//rolefunmenurelDao.addRolefunmenu(rolefunrel);
		}
		rolefunmenurelDao.addRolefunmenu(list);
	}

	
}
