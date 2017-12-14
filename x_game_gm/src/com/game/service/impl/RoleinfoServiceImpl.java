package com.game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.game.dao.RoleinfoMapper;
import com.game.entity.Roleinfo;
import com.game.service.RoleinfoService;


@Controller
public class RoleinfoServiceImpl implements RoleinfoService{

	@Autowired
	private RoleinfoMapper roleDao;
	@Override
	public List<Roleinfo> getAllRoleinfoList() {
		return roleDao.getAllRoleinfoList();
	}

}
