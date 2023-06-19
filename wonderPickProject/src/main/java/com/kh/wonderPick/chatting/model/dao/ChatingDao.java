package com.kh.wonderPick.chatting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.chatting.model.vo.AddPriceAndReason;
import com.kh.wonderPick.chatting.model.vo.BeforeReadChatings;
import com.kh.wonderPick.chatting.model.vo.Chating;
import com.kh.wonderPick.member.model.vo.Member;

@Repository
public class ChatingDao {

	public int createRoom(SqlSessionTemplate sqlSession, Chating c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatingMapper.createRoom", c);
	}

	public Chating selectRoomName(SqlSessionTemplate sqlSession, Chating c) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatingMapper.selectRoomName",c);
	}

	public ArrayList<Chating> checkRoomExisted(SqlSessionTemplate sqlSession, Chating c) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatingMapper.checkRoomExisted",c);
	}

	public int insertreadYetChatings(SqlSessionTemplate sqlSession, BeforeReadChatings brc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatingMapper.insertreadYetChatings",brc);
	}

	public ArrayList<BeforeReadChatings> selectreadYetChatings(SqlSessionTemplate sqlSession, Chating c) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatingMapper.selectreadYetChatings",c);
	}

	public int removeReadChat(SqlSessionTemplate sqlSession, Chating c) {
		// TODO Auto-generated method stub
		return sqlSession.delete("chatingMapper.removeReadChat",c);
	}

	public int countReadYetChatings(SqlSessionTemplate sqlSession, Chating roomName) {
		// TODO Auto-generated method stub
		return sqlSession.delete("chatingMapper.countReadYetChatings",roomName);
	}

	public ArrayList<Chating> selectAllRoom(SqlSessionTemplate sqlSession, Chating roomListSearch) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatingMapper.selectAllRoom",roomListSearch);
	}

	public int insertReasonPrice(SqlSessionTemplate sqlSession, ArrayList<AddPriceAndReason> list) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatingMapper.insertReasonPrice",list);
	}

	public ArrayList<AddPriceAndReason> selectCondition(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatingMapper.selectCondition",boardNo);
	}

	public Member selectartistNick(SqlSessionTemplate sqlSession, int artistNickName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatingMapper.selectartistNick",artistNickName);
	}

}
