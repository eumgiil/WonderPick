package com.kh.wonderPick.board.contestBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.board.contestBoard.model.dao.ContestDao;
import com.kh.wonderPick.board.contestBoard.model.vo.Emoticon;

@Service
public class ContestServiceImpl implements ContestService {
	
	@Autowired
	private ContestDao contestDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Emoticon> selectMain() {
		return contestDao.selectMain(sqlSession);
	}

}
