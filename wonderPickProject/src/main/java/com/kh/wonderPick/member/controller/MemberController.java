package com.kh.wonderPick.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class MemberController {
	
	@RequestMapping("login.me")
	public void loginMember(Member m) {
		
	}
}
