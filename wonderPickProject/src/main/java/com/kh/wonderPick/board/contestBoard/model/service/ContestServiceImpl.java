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
	public int insertContest(Board board, ArrayList<BoardImage> list, Contest contest) {
		
		
		System.out.println("서비스 :" + list);
		
		System.out.println(board);
		
		int result1 = contestDao.insertMainBoard(sqlSession, board);
		
		int result2 = 0;
		
		for(int i = 0; i < list.size(); i++ ) {
			
			return contestDao.insertBoardImage(sqlSession, list.get(i));
			
		}
		System.out.println(result2);
		
		
		int result3 = contestDao.insertEmoticon(sqlSession, contest);
		
		
		
		return (result1 * result2 * result3);
		
	}


}
