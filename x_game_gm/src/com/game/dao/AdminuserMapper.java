package com.game.dao;

import java.util.List;
import java.util.Map;

import com.game.entity.Adminuser;


public interface AdminuserMapper {

	Adminuser checkExistUser(Map<String, Object> map);

	List<Adminuser> getRoleinfoWithPaging(Map<String, Object> map);

	Long getAdminCount(String adminname);

	void insertAdminuser(Adminuser adminuser);

	void deleteEmpById(Integer id);

	Adminuser getAdminuserById(Integer id);

	void updateEmpById(Adminuser adminuser);

	Integer checkExitEmpById(Integer id);
   
}