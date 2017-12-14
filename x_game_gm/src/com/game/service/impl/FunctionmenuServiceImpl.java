package com.game.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.game.dao.FunctionmenuMapper;
import com.game.entity.Functionmenu;
import com.game.service.FunctionmenuService;

@Service
public class FunctionmenuServiceImpl implements FunctionmenuService{

	@Autowired
	private FunctionmenuMapper functionmenuDao;
	@Override
	public List<Functionmenu> getFunctionmenuByRoleid(Integer roleid) {
		return functionmenuDao.getFunctionmenuByRoleid(roleid);
	}
	
	public List<Functionmenu> getAllfunctionmenu() {
		return functionmenuDao.getAllfunctionmenu();
	}

	
}
