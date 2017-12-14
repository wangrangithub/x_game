package com.game.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.game.dao.AdminuserMapper;
import com.game.entity.Adminuser;
import com.game.service.AdminuserService;
import com.game.util.PageUtil;


@Service
public class AdminuserServiceImpl implements AdminuserService{

	@Autowired
	private AdminuserMapper adminUserDao;
	
	@Override
	public Adminuser checkExistUser(String username, String userpass) {
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("username", username);
		map.put("userpass", userpass);
		
		return adminUserDao.checkExistUser(map);
	}
	@Override
	public PageUtil<Adminuser> getRoleinfoWithPaging(String adminname, Integer pageIndex, Integer pageSize) {
		PageUtil<Adminuser> pageModel = new PageUtil<Adminuser> (pageIndex,pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("adminname", adminname);
		map.put("skip", (pageIndex-1)*pageSize);
		map.put("take", pageSize);
		List<Adminuser> list=adminUserDao.getRoleinfoWithPaging(map);
		Long count = adminUserDao.getAdminCount(adminname);
		pageModel.setDateList(list);
		pageModel.setTotalCount(count);
		return pageModel;
	}
	@Override
	public void insertAdminuser(Adminuser adminuser) {
		adminUserDao.insertAdminuser(adminuser);
	}
	@Override
	public void deleteEmpById(Integer id) {
		adminUserDao.deleteEmpById(id);
	}
	@Override
	public Adminuser getAdminuserById(Integer id) {
		return adminUserDao.getAdminuserById(id);
	}
	@Override
	public void updateEmpById(Adminuser adminuser) {
		adminUserDao.updateEmpById(adminuser);
	}
	@Override
	public Integer checkExitEmpById(Integer id) {
		return adminUserDao.checkExitEmpById(id);
	}

	
}
