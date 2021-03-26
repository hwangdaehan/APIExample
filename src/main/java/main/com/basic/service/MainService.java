package main.com.basic.service;

import java.util.List;

import main.com.basic.vo.UserVO;

public interface MainService {

	public List<UserVO> findUserList();
	
	public UserVO findUser(String id);
	
	public void addUser(UserVO vo);
	
	public void deleteUser(String user_id, String user_pw);

}
