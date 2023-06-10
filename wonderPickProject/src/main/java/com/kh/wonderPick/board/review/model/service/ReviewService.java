package com.kh.wonderPick.board.review.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.review.model.vo.Review;

public interface ReviewService {

	ArrayList<Review> selectBoardReviewList(int bno);
	
}
