package com.kh.wonderPick.search.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.board.contestBoard.model.vo.Contest;
import com.kh.wonderPick.board.contestBoard.model.vo.Search;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService {
	
	
	
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public ArrayList<Search> searchAutoComplet(String searchValue) {
		return searchDao.searchAutoComplet(sqlSession, searchValue);
	}

	@Override
	public ArrayList<Contest> searchArtResult(String keyword) {
		return searchDao.searchArtResult(sqlSession, keyword);
	}

	@Override
	public ArrayList<Goods> searchGoodsResult(String keyword) {
		return searchDao.searchGoodsResult(sqlSession, keyword);
	}

}
