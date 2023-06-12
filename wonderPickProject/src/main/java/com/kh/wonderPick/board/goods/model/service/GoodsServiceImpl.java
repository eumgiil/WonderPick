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
import com.kh.wonderPick.board.review.model.vo.Review;
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
	public int selectCategoryListCount(String goodsCategory) {
		return goodsDao.selectCategoryListCount(sqlSession, goodsCategory);
	}
	@Override
	public ArrayList<Goods> selectCategoryList(PageInfo pi, String goodsCategory) {
		return goodsDao.selectCategoryList(sqlSession, pi, goodsCategory);
	}
	
	

	@Override
	@Transactional
	public int insertGoods(Goods g , Board b, BoardImage bi) {
		
		int result2 = goodsDao.insertBoard(sqlSession, b);
		 int result = goodsDao.insertGoods(sqlSession, g);
		 int result3 = 1;
		 if(bi != null) {
			 result3 = goodsDao.insertBoardImage(sqlSession, bi);
		 }
		 
			  return (result*result2*result3);
	}

	@Override
	public int increaseCount(int boardNo) {
		return goodsDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Goods selectGoods(int boardNo) {
		return goodsDao.selectGoods(sqlSession, boardNo);
	}
	/*
	@Override
	public int selectReviewCount(int boardNo) {
		return goodsDao.selectReviewCount(sqlSession, boardNo);
	}
	*/
	
	@Override
	public ArrayList<Review> selectReviewList(int boardNo) {
		return goodsDao.selectReviewList(sqlSession, boardNo);
	}

	//댓글
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return goodsDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return goodsDao.insertReply(sqlSession, r);
	}

	// 대댓글
	
	
	@Override
	public ArrayList<Re_Reply> selectReReplyList(int replyNo) {
		return goodsDao.selectReReplyList(sqlSession, replyNo);
	}

	@Override
	public int insertReReply(Re_Reply re) {
		return goodsDao.insertReReply(sqlSession, re);
	}
	
	@Override
	public int selectReplyListCount(int boardNo) {
		return goodsDao.selectReplyListCount(sqlSession, boardNo);
	}
	
	@Override
	public int updateGoods(Goods g) {
		return 0;
	}

	

	


}
