package main.com.message.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.com.message.dao.MessageMapper;
import main.com.message.service.MessageService;
import main.com.message.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Resource
	MessageMapper messageMapper;
	
	@Override
	public List<MessageVO> findList(String receiver_name) {
		return messageMapper.findList(receiver_name);
	}

	@Override
	public void insertMessage(MessageVO messageVO) {
			messageVO.setGubun("0");
			messageVO.setRead_yn("0");
			
			messageMapper.insertMessage(messageVO);
	}

	@Override
	public void updateViewCheck(String view_check) {
		messageMapper.updateViewCheck(view_check);
	}

	@Override
	public void deleteLetter(String view_check) {
		messageMapper.deleteLetter(view_check);
	}

}
