
package com.kh.wonderPick.board.artBoard.model.dao;

import java.util.ArrayList;

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
import com.kh.wonderPick.common.model.vo.PageInfo;

@Repository
public class ArtBoardDao {
	
	public int selectArtListCount(SqlSessionTemplate sqlSession, SearchArt searchArt) {
		return sqlSession.selectOne("artBoardMapper.selectArtListCount", searchArt);
	}
//	public int selectSearchListCount(SqlSessionTemplate sqlSession, SearchArt searchArt) {
//		return sqlSession.selectOne("artBoardMapper.selectSearchListCount", searchArt);
//	}
	
	public ArrayList<ArtBoardDTO> selectArtList(SqlSessionTemplate sqlSession, PageInfo pi, SearchArt searchArt){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectArtList", searchArt, rowBounds);
	}
//	public ArrayList<ArtBoardDTO> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchArt searchArt){
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		return (ArrayList)sqlSession.selectList("artBoardMapper.selectSearchList", searchArt, rowBounds);
//	}
	
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
	
	public ArtBoard selectArtBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("artBoardMapper.selectArtBoard", bno);
	}
	public ArrayList<Option> selectOptionList(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectOptionList", bno);
	}
	public ArrayList<BoardImage> selectBoardImage(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectBoardImage", bno);
	}
	
	

}
