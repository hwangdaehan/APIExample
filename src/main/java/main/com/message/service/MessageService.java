package main.com.message.service;

import java.util.List;

import main.com.message.vo.MessageVO;

public interface MessageService {

	public List<MessageVO> findList(String receiver_name);
	
	public void insertMessage(MessageVO messageVO);

	public void updateViewCheck(String view_check);
	
	public void deleteLetter(String view_check);
}
