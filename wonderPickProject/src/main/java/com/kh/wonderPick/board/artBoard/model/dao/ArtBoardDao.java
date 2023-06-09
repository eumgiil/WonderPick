
package com.kh.wonderPick.board.artBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Repository
public class ArtBoardDao {
	
	public int selectArtListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("artBoardMapper.selectArtListCount");
	}
	
	public ArrayList<ArtBoardDTO> selectArtList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		// 페이징처리 해야함. offset도 해야함
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectArtList", null, rowBounds);
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
	
	public int insertFiles(SqlSessionTemplate sqlSession, BoardImage boardImage) {
		return sqlSession.insert("artBoardMapper.insertFiles", boardImage);
	}
	
	
	

}
