package com.kh.wonderPick.chatting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.chatting.model.dao.ChatingDao;
import com.kh.wonderPick.chatting.model.vo.BeforeReadChatings;
import com.kh.wonderPick.chatting.model.vo.Chating;

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
	public ArrayList<Chating> selectAllRoom() {
		return chatingDao.selectAllRoom(sqlSession);
	}

	@Override
	public Chating selectRoomName(Chating c) {
		System.out.println(c);
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
}
