package com.ex.service.User;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ex.dao.User.UserMapper;

@Service
public class UserService {

	
	 @Autowired 
	 UserMapper userMapper;
	 
	public Map<String,Object> insertUser(Map<String,Object> param){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		int insertCount = userMapper.insertUser(param);
		if(insertCount == 1) {
			resultMap.put("resultCode", 200);
		}else {
			resultMap.put("resultCode", 500);
		}
		return resultMap;
	}
	//유저 상세보기
	public Map<String, Object> getUser(Map<String, Object> param) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultUser", userMapper.getUser(param));
		return resultMap;
	}
	//유저 중복 아이디
	public Map<String, Object> getUserId(Map<String, Object> param) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", userMapper.getUserId(param));
		return resultMap;
	}
}
