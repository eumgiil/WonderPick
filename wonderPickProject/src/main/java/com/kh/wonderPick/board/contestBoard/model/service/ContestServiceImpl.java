package com.kh.wonderPick.board.contestBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
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
	    
	    int result4 = contestDao.insertVote(sqlSession, board);
		
		
		
		return (result1 * result2 * result3 * result4);
		
	}

	@Override
	public ArrayList<Contest> selectVotePage() {
		return contestDao.selectVotePage(sqlSession);
	}

	@Override
	public ArrayList<Contest> selectMoreList(Contest contest) {
		return contestDao.selectMoreList(sqlSession, contest);
	}

	@Override
	public int increaseCount(int boardNo) {
		return contestDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Contest> selectContestDetail(int boardNo) {
		return contestDao.selectContestDetail(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Contest> selectWinnerList() {
		return contestDao.selectWinnerList(sqlSession);
	}

	@Override
	public ArrayList<Heart> selectVoteLike(int boardNo) {
		return contestDao.selectVoteLike(sqlSession, boardNo);
	}

	@Override
	public int insertVoteHeart(Heart heart) {
		return contestDao.insertVoteHeart(sqlSession, heart);
	}

	@Override
	public int deleteVoteHeart(Heart heart) {
		return contestDao.deleteVoteHeart(sqlSession, heart);
	}



}
