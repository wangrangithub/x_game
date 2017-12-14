package com.game.dao;

import java.util.List;
import java.util.Map;

import com.game.entity.Roleinfo;


public interface RoleinfoMapper {

	List<Roleinfo> getRoleinfoWithPaging(Map<String, Object> map);

	Long getRoleinfoCount(String rolename);

	List<Roleinfo> getAllRoleinfoList();

	void insertRoleinfo(Roleinfo roleinfo);

	Integer getRoleidByName(String rolename);

	void deleteRoleinfoById(Integer id);

	Roleinfo getJurisdictionById(Integer id);

	void updateRoleinfo(Roleinfo roleinfo);
  
}