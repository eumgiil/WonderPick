package com.kh.wonderPick.board.goods.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Re_Reply;
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
import com.kh.wonderPick.board.goods.model.dao.GoodsDao;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	 
	@Override
	public int selectListCount() {
		return goodsDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Goods> selectGoodsList(PageInfo pi) {
		return goodsDao.selectGoodsList(sqlSession, pi);
	}

	@Override
	@Transactional
	public int insertGoods(Goods g , Board b, BoardImage bi) {
		
		 int result = goodsDao.insertGoods(sqlSession, g);
		 int result2 = goodsDao.insertBoard(sqlSession, b);
		 int result3 = 1;
		 if(bi != null) {
			 result3 = goodsDao.insertBoardImage(sqlSession, bi);
		 }
		 
			  return (result*result2*result3);
		
		 
	}

	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public Goods selectGoods(int boardNo) {
		return null;
	}

	@Override
	public int updateGoods(Goods g) {
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return null;
	}

	@Override
	public int insertReply(Reply r) {
		return 0;
	}

	@Override
	public ArrayList<Re_Reply> selectReReplyList(int replyNo) {
		return null;
	}

	@Override
	public int insertReReply(Re_Reply re) {
		return 0;
	}

}
