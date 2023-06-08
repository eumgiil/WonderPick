package com.kh.wonderPick.board.goods.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Re_Reply;
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.board.review.model.vo.Review;
import com.kh.wonderPick.common.model.vo.PageInfo;

public interface GoodsService {
	
	//게시글 총 개수 조회
	int selectListCount();
	
	// 게시글 리스트 조회
	ArrayList<Goods> selectGoodsList(PageInfo pi);
	
	// 게시글 작성하기
	int insertGoods(Goods g, Board b, BoardImage bi);
	
	// 게시글 조회수 증가
	int increaseCount(int boardNo);
	
	// 게시글 상세조회
	Goods selectGoods(int boardNo);
	
	// 게시글 수정하기
	int updateGoods(Goods g);
	
	// 리뷰 총 개수 조회
	//int selectReviewCount(int boardNo);
	
	// 상품 리뷰 리스트 조회
	ArrayList<Review> selectReviewList(int boardNo);
	
	
	
	// 댓글 리스트 조회
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 댓글 작성
	int insertReply(Reply r);
	
	
	
	// 대댓글 리스트 조회
	ArrayList<Re_Reply> selectReReplyList(int replyNo);
	
	// 대댓글 작성
	int insertReReply(Re_Reply re);
	
	
	
	


}
