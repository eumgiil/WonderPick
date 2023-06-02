package com.kh.wonderPick.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private String memberGrade;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickName;
	private int phone;
	private String email;
	private String address;
	private String payAccount;
	private String eamilYN;
	private String status;
	private Date enrollDate;
	private Date modifyDate;
}
