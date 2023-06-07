package com.kh.wonderPick.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

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
		/*String sessionId;
		Iterator iterator = users.iterator();
		while(iterator.hasNext()) {
			if((WebSocketSession)iterator.next()==session) {
				sessionId = getId(session);
				System.out.println(sessionId);
				if(!"".equals(sessionId)) {
					//httpSession에서 nickname 끌어와서 방 조화할거임
					Chating c = new Chating();
					c.setMembertNickName(((Member)httpSession.get("loginUser")).getNickName());
					ArrayList<Chating> roomNameList = chatingService.selectRoomName(c);
					memberRoomList.put(sessionId, roomNameList);
					System.out.println("loginUser성공");
				}
			}
		}*/

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
		System.out.println("recieveMsg.length : "+recieveMsg.length);

		if(recieveMsg[0].equals("getin")) {//소켓 접속시 처음으로 보낸 메세지일 뗴 getin,채팅방이름 이렇게 있음
			int loginStatus = 0;
			for(String key :roomInMap.keySet()) {
				if(key.equals(recieveMsg[1])) {
					ArrayList<WebSocketSession> list = ((ArrayList<WebSocketSession>)roomInMap.get(key));
					list.add(session);
					roomInMap.put(key,list);
					loginStatus++;
					for(WebSocketSession user :list) {
						TextMessage getinMessage = new TextMessage("someoneIn");
						user.sendMessage(getinMessage);
					}
				}
			}
			if(loginStatus==0) {
				ArrayList<WebSocketSession> list = new  ArrayList<WebSocketSession>();
				list.add(session);
				roomInMap.put(recieveMsg[1],list);
				loginStatus++;
			}
		}else {//단순 대화일 때
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
		/*if(recieveMsg.length==3) {
			//ArrayList<Chating> loginUserRooms = memberRoomList.get(recieveMsg[0]);
			//System.out.println(loginUserRooms);
			//ArrayList<Chating> otherUserRooms = memberRoomList.get(recieveMsg[1]);
			//System.out.println(otherUserRooms);
			TextMessage newMessage = new TextMessage(recieveMsg[2]);

			Date nowDate = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
			//for(Chating room : loginUserRooms) {
			//for(Chating room2 : otherUserRooms) {
			//if(room.getRoomName().equals(room2.getRoomName())) {//같은 방을 같고 있을때 키값을 가져와야함
			System.out.println("users : "+users);
			for(WebSocketSession user :users) {System.out.println("id : "+getId(user));
				if(getId(user).equals(recieveMsg[1])) {
					reciever=user;
				}
				if(getId(user).equals(recieveMsg[0]) || getId(user).equals(recieveMsg[1])) {
					System.out.println(reciever);
					if((reciever==null)) {
						BeforeReadChatings brc = new BeforeReadChatings();
						brc.setFromMember(recieveMsg[0]);
						brc.setToMember(recieveMsg[1]);
						brc.setContent(recieveMsg[2]);
						brc.setEnrollDate(simpleDateFormat.format(nowDate));
						chatingService.insertreadYetChatings(brc);
						if(getId(user).equals(recieveMsg[0])) {
							TextMessage notReadMessage = new TextMessage(recieveMsg[2]);
							user.sendMessage(notReadMessage);
						}
					}else {
						user.sendMessage(newMessage);
					}
				}
			}
			//}
			//}
			//}
		}
			for(WebSocketSession user :users) {
				if(getId(user).equals(recieveMsg[3]) ) {
					System.out.println("접속 getId: "+getId(user));
					System.out.println("접속 recieveMsg: "+recieveMsg[1]);
					TextMessage notReadMessage = new TextMessage(recieveMsg[1]);
					user.sendMessage(notReadMessage);
				}
			}*/



	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		for(String key :roomInMap.keySet()) {
			ArrayList<WebSocketSession> list = ((ArrayList<WebSocketSession>)roomInMap.get(key));
			switch (list.size()) {
			case 2:
				for(WebSocketSession user : list) {
					if(user==session) {
						list.remove(user);
						roomInMap.put(key, list);
					}
				}
				break;
			case 1:
				roomInMap.remove(key);
				break;
			}

			users.remove(session);
			//memberRoomList.remove(getId(user));
			System.out.println("종료");
		}
	}
}