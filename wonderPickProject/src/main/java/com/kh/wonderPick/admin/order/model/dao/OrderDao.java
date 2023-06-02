package com.kh.wonderPick.admin.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.wonderPick.admin.order.model.vo.Order;

public class OrderDao {

	public ArrayList<Order> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectList");
	}

}
