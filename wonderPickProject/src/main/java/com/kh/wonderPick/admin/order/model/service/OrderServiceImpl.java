package com.kh.wonderPick.admin.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.admin.order.model.dao.OrderDao;
import com.kh.wonderPick.admin.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public ArrayList<Order> seledtList() {
		return orderDao.selectList(sqlSession);
	}

}
