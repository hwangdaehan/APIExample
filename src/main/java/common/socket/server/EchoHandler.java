package common.socket.server;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import main.com.message.dao.MessageMapper;



 
public class EchoHandler extends TextWebSocketHandler {
	
	@Resource
	MessageMapper messageMapper;
	
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	
//	Map<String,WebSocketSession> us ers = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String user_name = searchUserName(session);
		sessionList.add(session);
			session.sendMessage(new TextMessage("recMs :"+messageMapper.countMessageView(user_name)));
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String user_name= searchUserName(session);

		
		for(WebSocketSession sess: sessionList) {
			sess.sendMessage(new TextMessage(user_name+": "+message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String user_name = searchUserName(session);
		System.out.println("연결 끊어짐");
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user_name+"님의 연결이 끊어졌습니다."));
		}
		sessionList.remove(session);
	}
	
	public String searchUserName(WebSocketSession session)throws Exception {
		String user_name;
		Map<String, Object> map;
		map = session.getAttributes();
		user_name = (String) map.get("user_name");
		return user_name;
	}
	
}