package com.kh.wonderPick.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wonderPick.member.model.service.MemberService;
import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("login.me")
	public void loginMember(Member m) {
		Member loginUser = memberService.loginMember(m);
	}
}
