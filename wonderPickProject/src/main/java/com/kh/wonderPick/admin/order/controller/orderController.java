package com.kh.wonderPick.admin.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wonderPick.admin.order.model.service.OrderService;

@Controller
public class orderController {

	@Autowired
	private OrderService orderService;
	
	
	
	@RequestMapping("order.on")
	public String selectList(Model model) {
		
		model.addAttribute("list",orderService.seledtList());
		return "order/orderEnrollForm";
		
	}
	
	
}
