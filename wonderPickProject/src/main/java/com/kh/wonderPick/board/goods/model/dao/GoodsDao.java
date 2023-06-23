package com.kh.wonderPick.board.goods.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
import com.kh.wonderPick.board.boardCommon.model.vo.Re_Reply;
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.board.review.model.vo.Review;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Repository
public class GoodsDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.selectListCount");
	}
	
	// 굿즈리스트 전체 페이지
	public ArrayList<Goods> selectGoodsList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodsList", null , rowBounds);
	}
	
	public int selectCategoryListCount(SqlSessionTemplate sqlSession, String goodsCategory) {
		return sqlSession.selectOne("goodsMapper.selectCategoryListCount", goodsCategory);
	}
	
	// 카테고리별 굿즈리스트 페이지
	public ArrayList<Goods> selectCategoryList(SqlSessionTemplate sqlSession, PageInfo pi, String goodsCategory){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
	     
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("goodsMapper.selectCategoryList", goodsCategory , rowBounds);
	}
	
	// 검색결과 개수 조회
	public int searchGoodsCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("goodsMapper.searchGoodsCount", map);
	}

	// 검색결과 리스트 조회
	public ArrayList<Goods> searchGoods(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi ){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("안뇽 나는 DAO~헷");
		return (ArrayList)sqlSession.selectList("goodsMapper.searchGoods",map, rowBounds );
		
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("goodsMapper.insertBoard", b);
	}
	
	public int insertGoods(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.insert("goodsMapper.insertGoods",g);
	}
	public int insertBoardImage(SqlSessionTemplate sqlSession, BoardImage bi) {
		return sqlSession.insert("goodsMapper.insertBoardImage", bi);
	}
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("goodsMapper.increaseCount", boardNo);
	}
	public Goods selectGoods(SqlSessionTemplate sqlSession , int boardNo) {
		return sqlSession.selectOne("goodsMapper.selectGoods", boardNo);
	}
	
	// 수정
	// 게시글 수정
	public int updateBoard(SqlSessionTemplate sqlSession , Board b) {
		return sqlSession.update("goodsMapper.updateBoard", b);
	}
	// 굿즈 수정
	public int updateGoods(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.update("goodsMapper.updateGoods",g);
	}
	// 게시판 이미지 수정
	public int updateBoardImage(SqlSessionTemplate sqlSession, BoardImage bi) {
		return sqlSession.update("goodsMapper.updateBoardImage", bi);
	}
	
	
	public ArrayList<BoardImage> selectBoardImage(SqlSessionTemplate sqlSession, int boardNo) {
		System.out.println("안뇽 나는 보드이미지 뎨요");
		return (ArrayList)sqlSession.selectList("goodsMapper.selectBoardImage", boardNo);
	}
	/*
	public int selectReviewCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("goodsMapper.selectReviewCount", boardNo);
	}
	*/
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession,  int boardNo){
		
		return (ArrayList)sqlSession.selectList("goodsMapper.selectReviewList", boardNo);
	}
	
	//댓글
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("goodsMapper.selectReplyList", boardNo);
	}
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("goodsMapper.insertReply", r);
	}
	
	public int selectReplyListCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("goodsMapper.selectReplyListCount", boardNo);
		
	}
	
	//대댓글
	public ArrayList<Re_Reply> selectReReplyList(SqlSessionTemplate sqlSession, int replyNo){
		return (ArrayList)sqlSession.selectList("goodsMapper.selectReReplyList", replyNo);
	}
	public int insertReReply(SqlSessionTemplate sqlSession, Re_Reply re) {
		return sqlSession.insert("goodsMapper.insertReReply", re);
	}
	
	// 회원별 좋아요 리스트 조회
	public ArrayList<Heart> selectHeartList(SqlSessionTemplate sqlSession ){
		System.out.println("안뇽 나는 하또 리스트 뎨요!");
		return (ArrayList)sqlSession.selectList("goodsMapper.selectHeartList" );
		
	}
	
	// 회원별 좋아요 상세 조회
	public Heart selectHeart(SqlSessionTemplate sqlSession, int boardNo ) {
		System.out.println("안녕 나는 하또 뎨요~~~~~");
		return sqlSession.selectOne("goodsMapper.selectHeart", boardNo);
	}
	
	// 좋아요 업데이트
	public int updateHeart(SqlSessionTemplate sqlSession, Heart h) {
		return sqlSession.update("goodsMapper.updateHeart", h);
	}
	
	// 댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.delete("goodsMapper.deleteReply", replyNo);
	}
	

}
