package com.kh.wonderPick.chatting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.chatting.model.dao.ChatingDao;
import com.kh.wonderPick.chatting.model.vo.AddPriceAndReason;
import com.kh.wonderPick.chatting.model.vo.BeforeReadChatings;
import com.kh.wonderPick.chatting.model.vo.Chating;
import com.kh.wonderPick.member.model.vo.Member;

@Service
public class ChatingServiceImpl implements  ChatingService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatingDao chatingDao;

	@Override
	public int createRoom(Chating c) {
		// TODO Auto-generated method stub
		return chatingDao.createRoom(sqlSession,c);
	}

	@Override
	public Chating selectRoomName(Chating c) {
		return chatingDao.selectRoomName(sqlSession,c);
	}

	@Override
	public ArrayList<Chating> checkRoomExisted(Chating c) {
		return chatingDao.checkRoomExisted(sqlSession,c);
	}

	@Override
	public int insertreadYetChatings(BeforeReadChatings brc) {
		// TODO Auto-generated method stub
		return chatingDao.insertreadYetChatings(sqlSession,brc);
	}

	@Override
	public ArrayList<BeforeReadChatings> selectreadYetChatings(Chating c) {
		// TODO Auto-generated method stub
		return chatingDao.selectreadYetChatings(sqlSession,c);
	}

	@Override
	public int removeReadChat(Chating c) {
		// TODO Auto-generated method stub
		return chatingDao.removeReadChat(sqlSession,c);
	}

	@Override
	public int countReadYetChatings(Chating roomName) {
		// TODO Auto-generated method stub
		return chatingDao.countReadYetChatings(sqlSession,roomName);
	}

	@Override
	public ArrayList<Chating> selectAllRoom(Chating roomListSearch) {
		// TODO Auto-generated method stub
		return chatingDao.selectAllRoom(sqlSession,roomListSearch);
	}

	@Override
	public int insertReasonPrice(ArrayList<AddPriceAndReason> list) {
		// TODO Auto-generated method stub
		return chatingDao.insertReasonPrice(sqlSession,list);
	}

	@Override
	public ArrayList<AddPriceAndReason> selectCondition(int boardNo) {
		// TODO Auto-generated method stub
		return chatingDao.selectCondition(sqlSession,boardNo);
	}

	@Override
	public Member selectartistNick(int artistNickName) {
		// TODO Auto-generated method stub
		return chatingDao.selectartistNick(sqlSession,artistNickName);
	}
}
