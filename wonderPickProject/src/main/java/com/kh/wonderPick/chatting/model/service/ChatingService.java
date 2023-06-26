package com.kh.wonderPick.chatting.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.chatting.model.vo.AcceptCondition;
import com.kh.wonderPick.chatting.model.vo.AddPriceAndReason;
import com.kh.wonderPick.chatting.model.vo.BeforeReadChatings;
import com.kh.wonderPick.chatting.model.vo.Chating;
import com.kh.wonderPick.member.model.vo.Member;

public interface ChatingService {


	int createRoom(Chating c);

	Chating selectRoomName(Chating c);

	ArrayList<Chating> checkRoomExisted(Chating c);
	
	int insertreadYetChatings(BeforeReadChatings brc);
	
	ArrayList<BeforeReadChatings> selectreadYetChatings(Chating c);

	int removeReadChat(Chating c);

	int countReadYetChatings(Chating roomName);

	ArrayList<Chating> selectAllRoom(Chating roomListSearch);

	int insertReasonPrice(ArrayList<AddPriceAndReason> list);

	ArrayList<AddPriceAndReason> selectCondition(Chating c);

	Member selectartistNick(int boardNo);

	int deletePriceAndReason(int[] rejectList);

	int insertAcceptCondition(AddPriceAndReason apar);

	int updatetAcceptCondition(Chating c);

	AcceptCondition selectAcceptStatus(Chating c);

	int deleteAcceptCondition(Chating c);
}
