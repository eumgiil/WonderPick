package com.kh.wonderPick.admin.order.model.vo;

import lombok.Data;

@Data
public class Order {

	private int orderNo;
	private String nickName;
	private int memberNo;
	private String orderType;
	private String orderContent;
	private int price;
	private String orderStatus;
	private String defaultSize;
	private int count;
	private String startDate;
	private String workDay;
	private String orderDate;
	private String depositDate;
	
}
