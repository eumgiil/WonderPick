package com.kh.wonderPick.board.contestBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.contestBoard.model.vo.Contest;

@Repository
public class ContestDao {

	public ArrayList<Contest> selectMain(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectMain");
	}

}
