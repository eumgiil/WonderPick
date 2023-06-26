package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.artBoard.model.dao.ArtBoardDao;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.artBoard.model.vo.SearchArt;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Service
public class ArtBoardServiceImpl implements ArtBoardService {

	@Autowired
	private ArtBoardDao artDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public int selectArtListCount(SearchArt searchArt) {
		return artDao.selectArtListCount(sqlSession, searchArt);
	}

	
	@Override
	public ArrayList<ArtBoardDTO> selectArtList(PageInfo pi, SearchArt searchArt) {
		return artDao.selectArtList(sqlSession, pi, searchArt);
	}


	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertArtBoard(Board board, ArtBoard artBoard, ArrayList<Option> list, ArrayList<BoardImage> files) {
		int result = artDao.insertBoard(sqlSession, board);
		result *= artDao.insertArtBoard(sqlSession, artBoard);
		for(int i = 0; i < list.size(); i++) {
			result *= artDao.insertOptions(sqlSession, list.get(i));
			for(int j = 0; j < list.get(i).getDetailOption().size(); j++) {
				result *= artDao.insertDetailOption(sqlSession, list.get(i).getDetailOption().get(j));
			}
		}
		for(int k = 0; k < files.size(); k++) {
			result *= artDao.insertFiles(sqlSession, files.get(k));
		}
		return result;
	}


	@Override
	public ArtBoard selectArtBoard(HashMap maps) {
		return artDao.selectArtBoard(sqlSession, maps);
	}

	@Override
	public ArrayList<Option> selectOptionList(int bno) {
		return artDao.selectOptionList(sqlSession, bno);
	}
	
	@Override
	public ArrayList<BoardImage> selectBoardImage(int bno) {
		return artDao.selectBoardImage(sqlSession, bno);
	}
	
	@Override
	@Transactional
	public int updateArtBoard(Board board, ArtBoard artBoard,
							  ArrayList<Integer> deleteOptionNos,
							  ArrayList<Option> optionList,
							  ArrayList<Integer> deleteBoardImgNo,
							  ArrayList<BoardImage> updateBoardImages,
							  ArrayList<BoardImage> insertBoardImages
							  ) {
		
		int result = artDao.updateBoard(sqlSession, board);
		result *= artDao.updateArtBoard(sqlSession, artBoard);
		
		// 디테일 옵션 -> 옵션 삭제
		for(int i = 0; i < deleteOptionNos.size(); i++) {
			result *= artDao.deleteDetailOption(sqlSession, deleteOptionNos.get(i));
		}
		result *= artDao.deleteOption(sqlSession, board.getBoardNo());
		// 옵션 -> 디테일 옵션 추가
		for(int i = 0; i < optionList.size(); i++) {
			result *= artDao.updateInsertOptions(sqlSession, optionList.get(i));
			for(int j = 0; j < optionList.get(i).getDetailOption().size(); j++) {
				result *= artDao.insertDetailOption(sqlSession, optionList.get(i).getDetailOption().get(j));
			}
		}
		
		// 사진 삭제
		for(int i = 0; i < deleteBoardImgNo.size(); i++) {
			result *= artDao.deleteFiles(sqlSession, deleteBoardImgNo.get(i));
		}
		// 사진 수정
		for(int i = 0; i < updateBoardImages.size(); i++){
			result *= artDao.updateFiles(sqlSession, updateBoardImages.get(i));
		}
		// 사진 등록
		for(int i = 0; i < insertBoardImages.size(); i++){
			result *= artDao.updateInsertFiles(sqlSession, insertBoardImages.get(i));
		}


		
		return result;
	}

	
	/* 문의 댓글 관련 */
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return artDao.selectReplyList(sqlSession, boardNo);
	}
	@Override
	public int insertReply(Reply r) {
		return artDao.insertReply(sqlSession, r);
	}
	@Override
	public int deleteReply(int replyNo) {
		return artDao.deleteReply(sqlSession, replyNo);
	}
	

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}