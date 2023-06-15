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
	
	/**
	 * 아이디 중복을 확인해주는 메소드
	 * @param checkId : 사용자가 입력한 아이디
	 * @return : 문자열로 중복이 있는지 없는지 보냄
	 */
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheckMember(String checkId) { // 숫자로 바로 보내려고하니까 406오류가뜸
												  // 그래서 문자열로 보내봄(네이버를참고함)
		return memberService.idCheckMember(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 닉네임 중복을 확인해주는 메소드
	 * @param checkNick : 사용자가 입력한 닉네임
	 * @return : 문자열로 중복이 잇는지 없는지 보냄
	 */
	@ResponseBody 
	@RequestMapping("nickCheck.me")
	public String nickCheckMember(String checkNick) {
		return memberService.nickCheckMember(checkNick) > 0 ? "NNNNN" : "NNNNY";
	}
	
	
	/**
	 * 회원가입 서비스
	 * @param m : 사용자가 입력한 값들을 담은 객체
	 * @param session : 메시지를 담아서 alert창으로 띄워줌
	 * @return : 회원가입 성공시 메인화면으로 돌려보냄
	 */
	@RequestMapping("signUp.me")
	public String signUpMember(Member m,
							   HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		m.setMemberPwd(encPwd);
		if(memberService.signUpMember(m)>0) {
			
			session.setAttribute("alertMsg", "회원가입을 축하합니다!");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패하셨습니다.");
			return "common/error";
		}
	}
	// 회원가입을 하면 기본 프로필을 발급해줄꺼임!
	// 근데 언제해야되나?
	// 일단 insert를 성공하면?
	// 그치 선행이 회원번호가 생겨야하는거니까 무조건 insert성공하고나면
	// 그럼 insert성공하고나면 기본프로필을 발급하는데, 만약 그 발급이 실패한다면? 그래도 회원가입 진행으로하나?
	// 일단DB에 데이터가 넘어간건데 그게맞나?
	// 그냥 무조건 기본 프로필을 발급해주고, 그걸로 하는게 맞다! 그럴려고 vo에 만들어둔거임!
	// profileImg 파일이름 // profilePath 파일경로
	
	/**
	 * 마이페이지url을 정확하게 알려주지 않기 위해서 거쳐서 보내줌
	 * @param session : 로그인 된 회원의 정보가 담겨있는지 확인 / 없다면 alertMsg에 메시지를 담아서 반환
	 * @return : 로그인 되어있다면 마이페이지jsp로, 되어있지않다면 경고메시지와함께 메인페이지로 보냄
	 */
	@RequestMapping("myPage.me")
	public String myPageMember(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "member/myInfoUpdate";
		} else {
			session.setAttribute("alertMsg", "올바르지 않은 접근입니다!");
			return "redirect:/";
		}
	}
	
	@RequestMapping("updateInfo.me")
	public void updateInfoMember(Member m) {
		System.out.println(m);
	}
}
