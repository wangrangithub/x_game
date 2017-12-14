package com.game.service;

import com.game.entity.Adminuser;
import com.game.util.PageUtil;

public interface AdminuserService {

	Adminuser checkExistUser(String username, String userpass);

	PageUtil<Adminuser> getRoleinfoWithPaging(String adminname, Integer pageIndex, Integer pageSize);

	void insertAdminuser(Adminuser adminuser);

	void deleteEmpById(Integer id);

	Adminuser getAdminuserById(Integer id);

	void updateEmpById(Adminuser adminuser);

	Integer checkExitEmpById(Integer id);

}
