package main.com.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.com.message.service.MessageService;
import main.com.message.vo.MessageVO;

@Controller
public class MessageController {
	
	@Resource
	MessageService messageService;
	
	@RequestMapping(value="/message/list.do",  method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> findMessageList(@ModelAttribute("messageVO") MessageVO messageVO,HttpServletRequest req, HttpServletResponse resp, ModelMap model){
		List<MessageVO> msg_result = messageService.findList(messageVO.getReceiver_name());
		Map<String,Object> result = new HashMap<>();
		result.put("result",msg_result);
		return result;
	}
	
	@RequestMapping(value="/message/message_proc.do")
	public void addMessageSend(@RequestParam String flag,@ModelAttribute("messageVO") MessageVO messageVO, HttpServletRequest req,HttpServletResponse response) throws IOException {
		boolean result =false;
		switch(flag) {
			case "insert" :
				messageService.insertMessage(messageVO);
				result=true;
				break;
			case "updateViewCheck" :
				messageService.updateViewCheck(messageVO.getView_check());
				result=true;
				break;
			case "letterDelete" :
				messageService.deleteLetter(messageVO.getView_check());
				result=true;
				break;
		}
		
		PrintWriter writer =response.getWriter();
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		writer.println(result);
	}
}
