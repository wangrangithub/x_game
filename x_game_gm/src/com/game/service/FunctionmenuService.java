package com.game.service;

import java.util.List;
import com.game.entity.Functionmenu;

public interface FunctionmenuService {

	List<Functionmenu> getFunctionmenuByRoleid(Integer roleid);

	List<Functionmenu> getAllfunctionmenu();

}
