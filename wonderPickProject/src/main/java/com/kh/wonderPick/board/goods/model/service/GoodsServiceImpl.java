package com.kh.wonderPick.board.goods.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
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
	public ArrayList<Goods> selectCategoryList(PageInfo pi , String goodsCategory) {
		System.out.println(goodsDao.selectCategoryList(sqlSession, pi, goodsCategory));
		return goodsDao.selectCategoryList(sqlSession, pi, goodsCategory);
	}
	
	@Override
	public int searchGoodsCount(HashMap map) {
		return goodsDao.searchGoodsCount(sqlSession, map);
	}
	@Override
	public ArrayList<Goods> searchGoods(HashMap map, PageInfo pi){
		return goodsDao.searchGoods(sqlSession, map , pi );
	}
	
	

	@Override
	@Transactional
	public int insertGoods(Board b, ArrayList<BoardImage> list, Goods g) {
		
		int result1 = goodsDao.insertBoard(sqlSession, b);
		int result2 = 1;
		for(int i=0; i<list.size(); i++) {
			goodsDao.insertBoardImage(sqlSession, list.get(i));
		}
		int result3 = goodsDao.insertGoods(sqlSession, g);
		
		return (result1 * result2 * result3);
		
	}

	@Override
	public int increaseCount(int boardNo) {
		return goodsDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Goods selectGoods(int boardNo) {
		return goodsDao.selectGoods(sqlSession, boardNo);
	}
	@Override
	public ArrayList<BoardImage> selectBoardImage(int boardNo) {
		return goodsDao.selectBoardImage(sqlSession, boardNo);
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
	
	@Override
	public ArrayList<Heart> selectHeartList(int memberNo ){
		return goodsDao.selectHeartList(sqlSession, memberNo);
	}
	
	@Override
	public int deleteReply(int replyNo) {
		return goodsDao.deleteReply(sqlSession, replyNo);
	}

	

	


}
