package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.board.artBoard.model.dao.ArtBoardDao;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;

@Service
public class ArtBoardServiceImpl implements ArtBoardService {

	@Autowired
	private ArtBoardDao artDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<ArtBoard> selectArtList() {
		return artDao.selectArtList(sqlSession);
	} 

}
