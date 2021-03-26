package main.com.message.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import main.com.message.vo.MessageVO;

@Mapper
public interface MessageMapper {
	public String countMessageView(String receiver_name);
	
	public List<MessageVO> findList(String receiver_name);
	
	public void insertMessage(MessageVO messageVO);
	
	public void updateViewCheck(String view_check);
	
	public void deleteLetter(String view_check);
}
