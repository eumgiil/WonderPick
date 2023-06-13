package com.kh.wonderPick.board.reply.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.reply.model.vo.Reply1;

@Repository
public class ReplyDao {

	public ArrayList<Reply1> selectReplyList(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("reply-mapper.selectReplyList", bno);
	}
	
}
