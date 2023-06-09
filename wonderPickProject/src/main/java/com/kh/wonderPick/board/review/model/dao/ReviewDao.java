package com.kh.wonderPick.board.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.review.model.vo.Review;

@Repository
public class ReviewDao {
	
public ArrayList<Review> selectBoardReviewList(SqlSessionTemplate sqlSession,  int bno){
		return (ArrayList)sqlSession.selectList("reviewMapper.selectBoardReviewList", bno);
	}

}
