package com.kh.wonderPick.board.contestBoard.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;

public interface ContestService {


	
	// 공모전 메인페이지 리스트 조회 
	// 이모티콘 사진, 제목, 투표수, 작가사진, 작가이름,
	// 여기는 역대우승 이모티콘만 불러오면 됨(10개) + 댓글기능
	ArrayList<Contest> selectTop10();

	int insertContest(Board board, ArrayList<BoardImage> list, int price);

	ArrayList<Contest> selectVotePage();

	// 조회수 증가
	//void increaseCount(int bno);

	//더보기 페이징처리
	ArrayList<Contest> selectMoreList(Contest contest);

	int increaseCount(int boardNo);

	ArrayList<Contest> selectContestDetail(int boardNo);

	ArrayList<Contest> selectWinnerList();

	ArrayList<Heart> selectVoteLike(int boardNo);

	int insertVoteHeart(Heart heart);

	int deleteVoteHeart(Heart heart);

	
	// 페이징처리 
	
	// 투표하는 페이지
	
	
	// 공모전 참가/신청하기
	
	
}
