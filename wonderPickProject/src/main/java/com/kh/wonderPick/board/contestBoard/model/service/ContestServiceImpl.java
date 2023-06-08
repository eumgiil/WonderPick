package com.kh.wonderPick.board.contestBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public int insertContest(Board board, BoardImage boardImage, Contest contest) {
		
		contestDao.insertMainBoard(sqlSession, board);
		
		contestDao.insertBoardImage(sqlSession, boardImage);
		
		contestDao.insertEmoticon(sqlSession, contest);
		
		
		
		return 0;
		
	}


}
