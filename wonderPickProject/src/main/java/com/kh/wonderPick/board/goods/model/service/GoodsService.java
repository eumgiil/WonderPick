package com.kh.wonderPick.board.goods.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
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
	
	// 카테고리별 게시글 총 개수 조회
	int selectCategoryListCount(String goodsCategory);
	
	
	// 카테고리별 게시글 리스트 조회
	ArrayList<Goods> selectCategoryList(PageInfo pi, String goodsCategory);
	
	// 게시글 작성하기
	int insertGoods(Board b, ArrayList<BoardImage> list, Goods g);
	
	// 게시글 조회수 증가
	int increaseCount(int boardNo);
	
	// 게시글 상세조회
	Goods selectGoods(int boardNo);
	
	// 게시글별 이미지 조회
	ArrayList<BoardImage> selectBoardImage(int boardNo);
	
	// 게시글 검색결과 개수 조회
	int searchGoodsCount(HashMap map);
	
	// 게시글 검색결과 리스트 조회
	ArrayList<Goods> searchGoods(HashMap map , PageInfo pi );
	
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
	
	int selectReplyListCount(int boardNo);
	
	// 대댓글 리스트 조회
	ArrayList<Re_Reply> selectReReplyList(int replyNo);
	
	// 대댓글 작성
	int insertReReply(Re_Reply re);
	
	// 회원별 좋아요 조회
	ArrayList<Heart> selectHeartList(int memberNo);
	
	
	// 댓글 삭제
	int deleteReply(int replyNo);
	
	


}
