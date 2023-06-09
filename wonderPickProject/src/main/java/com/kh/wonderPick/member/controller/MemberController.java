package com.kh.wonderPick.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.common.template.Pagination;
import com.kh.wonderPick.member.model.service.MemberService;
import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 메인페이지
	 * @return : 어디서는 로고이미지누르면 메인으로 돌려보냄
	 */
	@RequestMapping("main.re")
	public String mainRetrun() {
		return "redirect:/";
	}
	
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
	
	/**
	 * 로그아웃 서비스
	 * @param session : session에 저장되어있던 loginMember를 비워줌
	 * @return : 메인페이지로 돌려보냄
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * 회원가입 url을 정확하게 알려주지 않기위해서 거쳐서 보내줌
	 * @return : memberEnrollFrom.jsp로 보내줌
	 */
	@RequestMapping("selectGrade.me")
	public String selectGradeMember() {
		return "member/selectmemberGrade";
	}
	
	/**
	 * 등급 선택창에서 선택을 하면, 회원가입 폼으로 보내주는 메소드
	 * @param m : 선택한 등급이 담겨있는 객체
	 * @param session : 등급을 담아서 다른 곳에도 보내주기위해 session에 담음
	 * @return : signUpForm.jsp로 보내줌
	 */
	@RequestMapping("signUpForm.me")
	public String signUpForm(Member m,	
							   HttpSession session) {
		session.setAttribute("memberGrade", m.getMemberGrade());
		return "member/signUpForm";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheckMember(String checkId) { // 숫자로 바로 보내려고하니까 406오류가뜸
												  // 그래서 문자열로 보내봄(네이버를참고함)
		return memberService.idCheckMember(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String nickCheckMember(String checkNick) {
		return memberService.nickCheckMember(checkNick) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("signUp.me")
	public void signUpMember(Member m) {
		System.out.println(m);
	}
}
