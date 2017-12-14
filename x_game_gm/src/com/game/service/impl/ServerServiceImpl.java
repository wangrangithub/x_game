package com.game.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.game.dao.ServerMapper;
import com.game.entity.ServerEntity;
import com.game.service.ServerService;
import com.game.util.PageUtil;

@Service
public class ServerServiceImpl implements ServerService{

	@Autowired
	private ServerMapper dao;
	
	@Override
	public PageUtil<ServerEntity> getServerWithPaging(Integer pageIndex, Integer pageSize) {
		return null;
	}

	@Override
	public void insertServer(ServerEntity entity) {
		dao.insert(entity);
	}

	@Override
	public void deleteById(Integer id) {
	}

	@Override
	public ServerEntity getById(Integer id) {
		return null;
	}

	@Override
	public void update(ServerEntity entity) {
	}

}
