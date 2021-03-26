package main.com.basic.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.web.bind.annotation.RequestMapping;

public class TestController {
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@RequestMapping(value="/test01.do")
	public void TestConn()throws SQLException {
		System.out.println("Conn...."+sqlFactory);
	}
	
}
