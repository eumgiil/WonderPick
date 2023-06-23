package com.kh.wonderPick.search.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;
import com.kh.wonderPick.board.contestBoard.model.vo.Search;
import com.kh.wonderPick.board.goods.model.vo.Goods;

@Repository
public class SearchDao {
	
	public ArrayList<Search> searchAutoComplet(SqlSessionTemplate sqlSession, String searchValue) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchAutoComplet", searchValue);
	}

	public ArrayList<ArtBoardDTO> searchArtResult(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchArtResult", keyword);
	}

	public ArrayList<Goods> searchGoodsResult(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchGoodsResult", keyword);
	}

	public ArrayList<Contest> searchContestResult(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchContestResult", keyword);
	}


}
