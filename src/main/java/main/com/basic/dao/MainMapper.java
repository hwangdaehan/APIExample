package main.com.basic.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import main.com.basic.vo.UserVO;

@Mapper
public interface MainMapper {

	public List<UserVO> findUserList()throws SQLException;
	
	public void addUser(UserVO vo)throws SQLException;
	
	public UserVO findUser(String id)throws SQLException;
	
	public void deleteUser(String user_id,String user_pw)throws SQLException;
}

