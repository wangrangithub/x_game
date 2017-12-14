package com.game.dao;

import java.util.List;
import java.util.Map;

import com.game.entity.ServerEntity;


public interface ServerMapper {

	List<ServerEntity> getWithPaging(Map<String, Object> map);

	void insert(ServerEntity entity);

	void deleteById(Integer id);

	ServerEntity getById(Integer id);

	void update(ServerEntity entity);
  
}