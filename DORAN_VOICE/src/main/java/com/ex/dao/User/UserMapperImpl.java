package com.ex.dao.User;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMapperImpl implements UserMapper {

	String namespace = "com.ex.dao.User.UserMapper";
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insertUser(Map<String, Object> param) {
		
		return sqlSession.insert(namespace + ".insertUser", param);
	}

	@Override
	public Map<String, Object> getUser(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getUser", param);
	}

	@Override
	public int getUserId(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getUserId", param);
	}

}
