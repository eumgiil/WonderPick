package com.kh.wonderPick.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wonderPick.member.model.service.MemberService;
import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	/**
	 * 로그인 서비스
	 * @param m : 로그인창에서 입력한 아이디, 비번의 정보를 가지고있는 객체
	 * @param session : HttpSession loginMember의 정보와 오류났을경우 alert창을 띄워주기위한 session
	 * @return : 메인화면으로 돌려보냄
	 */
	@RequestMapping("login.me")
	public String loginMember(Member m,
							HttpSession session) {
		Member loginMember = memberService.loginMember(m);
		if(loginMember != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "등록되지 않거나, 잘못된 정보입니다.");
			return "redirect:/";
		}
		
	}
}