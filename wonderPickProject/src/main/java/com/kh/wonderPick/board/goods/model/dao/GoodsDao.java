package com.kh.wonderPick.board.goods.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Repository
public class GoodsDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.selectListCount");
	}
	
	
	public ArrayList<Goods> selectGoodsList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodsList", null , rowBounds);
	}
	/*
	public int insertGoods(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.insert("goodsMapper.insertGoods",g);
	}
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("goodsMapper.insertBoard", b);
	}
	public int insertBoardImage(SqlSessionTemplate sqlSession, BoardImage bi) {
		return sqlSession.insert("goodsMapper.insertBoardImage", bi);
	}
	*/

}
