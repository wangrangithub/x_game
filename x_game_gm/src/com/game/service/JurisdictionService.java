package com.game.service;

import com.game.entity.Roleinfo;
import com.game.util.PageUtil;

public interface JurisdictionService {

	PageUtil<Roleinfo> getRoleinfoWithPaging(String rolename, Integer pageIndex, Integer pageSize);

	void insertRoleinfo(Roleinfo roleinfo, Integer[] funids);

	void deleteRoleinfoById(Integer id);

	Roleinfo getJurisdictionById(Integer id);

	Integer[] getfunctionmenuByFuntId(Integer id);

	void updateRoleinfo(Roleinfo roleinfo, Integer[] funids);
}
