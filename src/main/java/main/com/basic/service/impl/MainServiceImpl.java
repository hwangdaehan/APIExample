package main.com.basic.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.com.basic.dao.MainMapper;
import main.com.basic.service.MainService;
import main.com.basic.vo.UserVO;


@Service
public class MainServiceImpl implements MainService {

	@Resource
	MainMapper mainMapper;
	
	@Override
	public List<UserVO> findUserList() {
		try {
			return mainMapper.findUserList();
		} catch (SQLException e) {
				throw new RuntimeException("사용자 조회 도중 오류 발생"+e);
		}
	}

	@Override
	public void addUser(UserVO vo) {
		try {
			 vo.setDelete_at("0");
			 mainMapper.addUser(vo);
		} catch (SQLException e) {
			throw new RuntimeException("회원 등록 중 오류가 발생했습니다.");
		}
		
	}

	@Override
	public UserVO findUser(String id) {
		UserVO resultVO;
		try {
			resultVO = mainMapper.findUser(id);
		} catch (SQLException e) {
			throw new RuntimeException("회원 조회 중 오류가 발생했습니다.");
		}
		return resultVO;
	}

	@Override
	public void deleteUser(String user_id, String user_pw) {
			try {
				mainMapper.deleteUser(user_id,user_pw);
			} catch (SQLException e) {
				throw new RuntimeException("사용자 삭제 도중 오류 발생");
			}
		
	}

}
