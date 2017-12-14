package com.game.service;

import com.game.entity.ServerEntity;
import com.game.util.PageUtil;

public interface ServerService {

	PageUtil<ServerEntity> getServerWithPaging(Integer pageIndex, Integer pageSize);

	void insertServer(ServerEntity entity);

	void deleteById(Integer id);

	ServerEntity getById(Integer id);

	void update(ServerEntity entity);
}
