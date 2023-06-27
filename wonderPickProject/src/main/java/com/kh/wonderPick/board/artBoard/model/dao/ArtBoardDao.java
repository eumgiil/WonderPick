
package com.kh.wonderPick.board.artBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.artBoard.model.vo.DetailOption;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.artBoard.model.vo.SearchArt;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Repository
public class ArtBoardDao {
	
	public int selectArtListCount(SqlSessionTemplate sqlSession, SearchArt searchArt) {
		return sqlSession.selectOne("artBoardMapper.selectArtListCount", searchArt);
	}
	
	public ArrayList<ArtBoardDTO> selectArtList(SqlSessionTemplate sqlSession, PageInfo pi, SearchArt searchArt){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectArtList", searchArt, rowBounds);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("artBoardMapper.insertBoard", board);
	}
	public int insertArtBoard(SqlSessionTemplate sqlSession, ArtBoard artBoard) {
		return sqlSession.insert("artBoardMapper.insertArtBoard", artBoard);
	}
	public int insertOptions(SqlSessionTemplate sqlSession, Option option) {
		return sqlSession.insert("artBoardMapper.insertOptions", option);
	}
	public int insertDetailOption(SqlSessionTemplate sqlSession, DetailOption detailOption) {
		return sqlSession.insert("artBoardMapper.insertDetailOption", detailOption);
	}
	public int insertFiles(SqlSessionTemplate sqlSession, BoardImage boardImage) {
		return sqlSession.insert("artBoardMapper.insertFiles", boardImage);
	}
	
	public ArtBoard selectArtBoard(SqlSessionTemplate sqlSession, HashMap maps) {
		return sqlSession.selectOne("artBoardMapper.selectArtBoard", maps);
	}
	public ArrayList<Option> selectOptionList(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectOptionList", bno);
	}
	public ArrayList<BoardImage> selectBoardImage(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectBoardImage", bno);
	}
	public int selectBoardImgNoCount(SqlSessionTemplate sqlSession, String src){
		return sqlSession.selectOne("artBoardMapper.selectBoardImgNoCount", src);
	}
	public int selectBoardImgNo(SqlSessionTemplate sqlSession, String src){
		return sqlSession.selectOne("artBoardMapper.selectBoardImgNo", src);
	}
	
	// 수정 : 게시글
	public int updateBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.update("artBoardMapper.updateBoard", board);
	}
	public int updateArtBoard(SqlSessionTemplate sqlSession, ArtBoard artBoard) {
		return sqlSession.update("artBoardMapper.updateArtBoard", artBoard);
	}
	// 삭제 : 옵션
	public int deleteDetailOption(SqlSessionTemplate sqlSession, int optionNo) {
		return sqlSession.delete("artBoardMapper.deleteDetailOption", optionNo);
	}
	// 삭제 : 디테일 옵션
	public int deleteOption(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("artBoardMapper.deleteOption", bno);
	}
	// 업데이트용 옵션 등록 
	public int updateInsertOptions(SqlSessionTemplate sqlSession, Option option) {
		return sqlSession.insert("artBoardMapper.updateInsertOptions", option);
	}
	// 삭제 : 사진
	public int deleteFiles(SqlSessionTemplate sqlSession, int deleteBoardImgNo) {
		return sqlSession.delete("artBoardMapper.deleteFiles", deleteBoardImgNo);
	}
	// 수정 : 사진
	public int updateFiles(SqlSessionTemplate sqlSession, BoardImage boardImage) {
		return sqlSession.update("artBoardMapper.updateFiles", boardImage);
	}
	// 업데이트용 사진 등록 
	public int updateInsertFiles(SqlSessionTemplate sqlSession, BoardImage boardImage) {
		return sqlSession.insert("artBoardMapper.updateInsertFiles", boardImage);
	}
	// boardContent 업데이트 
	public int updateBoardContent(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.update("artBoardMapper.updateBoardContent", board);
	}
	
	// 문의 댓글
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectReplyList", boardNo);
	}
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("artBoardMapper.insertReply", r);
	}
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.delete("artBoardMapper.deleteReply", replyNo);
	}
	
	// 게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("artBoardMapper.deleteBoard", bno);
	}

	
	

}
