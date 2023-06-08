package com.kh.wonderPick.chatting.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.chatting.model.vo.BeforeReadChatings;
import com.kh.wonderPick.chatting.model.vo.Chating;

public interface ChatingService {


	int createRoom(Chating c);

	ArrayList<Chating> selectAllRoom();

	Chating selectRoomName(Chating c);

	ArrayList<Chating> checkRoomExisted(Chating c);
	
	int insertreadYetChatings(BeforeReadChatings brc);
	
	ArrayList<BeforeReadChatings> selectreadYetChatings(Chating c);

	int removeReadChat(Chating c);

	int countReadYetChatings(Chating roomName);
}
