package com.game.dao;

import java.util.List;

import com.game.entity.Functionmenu;

public interface FunctionmenuMapper {

	List<Functionmenu> getFunctionmenuByRoleid(Integer roleid);

	List<Functionmenu> getAllfunctionmenu();
 
}