package com.kh.wonderPick.chatting.model.vo;

import lombok.Data;

@Data
public class AddPriceAndReason {
	private int optionNo;
	private int boardNo;
	private String addPrices;
	private String request;
	private int accepter;
	private String roomName;
	private int totalPrice;
	private String orderContent;
	private int price;
	private String filePath;
	private int count;
}
