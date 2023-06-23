package com.kh.wonderPick.chatting.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.wonderPick.member.model.vo.Member;

public class WebSocketBasicServer extends TextWebSocketHandler{

	private Set<WebSocketSession> users = new CopyOnWriteArraySet();
	private Map<String,ArrayList<WebSocketSession>> roomInMap = new ConcurrentHashMap<String,ArrayList<WebSocketSession>>();//키:닉네임 value방제목
	private Map<String,Object> httpSession = new ConcurrentHashMap<String, Object>();
	//쓰레드 클래스를 붙여라
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub

		System.out.println(session);

		System.out.println("접속성공");
		
		users.add(session);
		
		System.out.println(users);

		System.out.println("접속 인원 : "+users.size());
	}

	private String getId(WebSocketSession session) {
		// TODO Auto-generated method stub
		httpSession = session.getAttributes();
		Member loginUser = (Member) httpSession.get("loginUser");
		if(loginUser!=null) {
			return loginUser.getNickName();
		}
		else {
			return "";
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub

		String[] recieveMsg  = message.getPayload().split(",");
		System.out.println("msg : "+message.getPayload());
		
		if(recieveMsg[0].equals("getin")) {//소켓 접속시 처음으로 보낸 메세지일 뗴 getin,채팅방이름 이렇게 있음
			if(!"".equals(recieveMsg[1])) {
				//방명을 키로한 리스트에 추가하는 작업
				ArrayList<WebSocketSession> list = new ArrayList<WebSocketSession>();
				
				for(String key : roomInMap.keySet()) {
					if(key.equals(recieveMsg[1])) {//들어가고자하는 방이 있다면
						list = ((ArrayList<WebSocketSession>)roomInMap.get(key));
						list.add(session);
					}
				}
				
				if(list.isEmpty()) {
					list.add(session);
					roomInMap.put(recieveMsg[1], list);
				}else {
					roomInMap.put(recieveMsg[1], list);
				}
				for(WebSocketSession user : (ArrayList<WebSocketSession>)roomInMap.get(recieveMsg[1])) {
					TextMessage getInReadMessage = new TextMessage("someoneIn,"+recieveMsg[2]);
					user.sendMessage(getInReadMessage);
				}
			}
			
			//방이 존재	하면 value인 리스트에 session추가
			//방이 존재하지 않는다면 방명과 value추가
			
		}else {//단순 대화일 때 프로토콜 만들어줘야함
			System.out.println(roomInMap);
			for(String key :roomInMap.keySet()) {
				if(key.equals(recieveMsg[0])) {
					ArrayList<WebSocketSession> list = ((ArrayList<WebSocketSession>)roomInMap.get(key));
					if(list.size()!=2) {
						for(WebSocketSession user :list) {
							TextMessage notReadMessage = new TextMessage("1,"+recieveMsg[3]);
							user.sendMessage(notReadMessage);
						}
					}else {
						for(WebSocketSession user :list) {
							TextMessage newMessage = new TextMessage("2,"+recieveMsg[3]);
							user.sendMessage(newMessage);
						}
					}
				}
			}
			
			
			 
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		// TODO Auto-generated method stub
		for(String key :roomInMap.keySet()) {
			ArrayList<WebSocketSession> list = ((ArrayList<WebSocketSession>)roomInMap.get(key));
			ArrayList<WebSocketSession> removed = new ArrayList<WebSocketSession>();
			
			switch (list.size()) {
			case 2:
				for(WebSocketSession user : list) {// ConcurrentModificationException 발생 
					if(user==session) {
						removed.add(user);
					}
				}
				list.removeAll(removed);
				roomInMap.put(key, list);
				break;
			case 1:
				roomInMap.remove(key);
				break;
			}

			users.remove(session);
			System.out.println("종료"+status);
		}
	}
	
	
	public Map<String,ArrayList<WebSocketSession>> changeRoom(String roomName, String myName) {
		for(String key : roomInMap.keySet()) {
			if(key.equals(roomName)) {
				ArrayList<WebSocketSession> list = (ArrayList<WebSocketSession>)roomInMap.get(key);
				ArrayList<WebSocketSession> removed = new ArrayList<WebSocketSession>();
				for(WebSocketSession user : list) {
					if(getId(user).equals(myName)) {
						removed.add(user);
					}
				}
				list.removeAll(removed);
				roomInMap.put(key, list);
			}
		}
		return roomInMap;
	}
	
}