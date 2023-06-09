package com.kh.wonderPick.board.contestBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.contestBoard.model.dao.ContestDao;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;

@Service
public class ContestServiceImpl implements ContestService {
	
	@Autowired
	private ContestDao contestDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Contest> selectTop10() {
		return (ArrayList)contestDao.selectTop10(sqlSession);
	}
	
	@Transactional
	@Override
	public int insertContest(Board board, ArrayList<BoardImage> list, int price) {
		
		
		int result1 = contestDao.insertMainBoard(sqlSession, board);
		
		int result2 = 1;
		
		for(int i = 0; i < list.size(); i++ ) {
			
			contestDao.insertBoardImage(sqlSession, list.get(i));
			
		}
		
	    int result3 = contestDao.insertPrice(sqlSession, price);
		
		
		
		return (result1 * result2 * result3);
		
	}

	@Override
	public ArrayList<Contest> selectVotePage() {
		
		return contestDao.selectVotePage(sqlSession);
	}


}
