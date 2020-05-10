package com.ex.dao.User;

import java.util.Map;

public interface UserMapper {

	
	public int insertUser(Map<String,Object> param);

	public Map<String,Object> getUser(Map<String,Object> param);

	public int getUserId(Map<String, Object> param);
	
}
