package com.kh.wonderPick.board.reply.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.board.reply.model.dao.ReplyDao;
import com.kh.wonderPick.board.reply.model.vo.Reply1;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public ArrayList<Reply1> selectReplyList(int bno) {
		return replyDao.selectReplyList(sqlSession, bno);
	}

}
