package com.game.dao;

import java.util.List;

import com.game.entity.Rolefunmenurel;

public interface RolefunmenurelMapper {

	void addRolefunmenu(List<Rolefunmenurel> list);

	void deleteRoleFunByRoleid(Integer id);

	Integer[] getfunctionmenuByFuntId(Integer id);

	void deleteFunByRoleid(Integer roleid);
  
}