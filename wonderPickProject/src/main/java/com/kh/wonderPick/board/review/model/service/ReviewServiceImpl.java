package com.kh.wonderPick.board.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.board.review.model.dao.ReviewDao;
import com.kh.wonderPick.board.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Review> selectBoardReviewList(int bno) {
		return reviewDao.selectBoardReviewList(sqlSession, bno);
	}

}
