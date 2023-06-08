package com.kh.wonderPick.chatting.template;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;



public class CreateRoomId {

	private String roomId;
	
	public String createRoomId(String myMemNo, String youMemNo) {
		
		String we = '@'+myMemNo+'@'+youMemNo;

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random()*90000) + 10000;
		
		this.roomId= we+currentTime+ranNum;
		
		return roomId;
	}
	
}
