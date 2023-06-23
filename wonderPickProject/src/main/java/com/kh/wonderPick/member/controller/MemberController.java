package com.kh.wonderPick.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.wonderPick.member.model.service.MemberService;
import com.kh.wonderPick.member.model.vo.Member;
import com.kh.wonderPick.member.model.vo.MemberImage;
import com.kh.wonderPick.member.model.vo.SecretCode;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSenderImpl sender;
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
		} else {
			session.setAttribute("alertMsg", "등록되지 않거나, 잘못된 정보입니다.");
		}
		return "redirect:/";
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
	
	@ResponseBody
	@RequestMapping("emailCheck.me")
	public String emailCheckMember(String checkEmail, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage(); 
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		String secret = generateSectret();
		
		SecretCode secretCode = SecretCode.builder()
													.who(ip)
													.secret(secret)
													.build();
		System.out.println(checkEmail);
		System.out.println(secretCode.getWho());
		System.out.println(secretCode.getSecret());
		System.out.println(secretCode);
		if(memberService.insertSecret(secretCode) > 0) {
			helper.setTo(checkEmail);
			helper.setSubject("Wonder Pick 인증번호입니다.");
			helper.setText("인증번호 : " + secret);
			
			sender.send(message);
			
			return "success";
		} else {
			return "error";
		}
	}
	
	public String generateSectret() {
		Random r = new Random();
		int i = r.nextInt(10000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(i);
		
		return secret;
	}
	
	/**
	 * 회원가입 서비스
	 * @param m : 사용자가 입력한 값들을 담은 객체
	 * @param emailAgree : 이메일 수신 동의 여부 / 체크를 하지 않으면 값이 넘어오지 않기때문에, 기본값을 설정
	 * @param session : 메시지를 담아서 alert창으로 띄워줌
	 * @return : 메인화면으로 돌려보냄
	 */
	@RequestMapping("signUp.me")
	public String signUpMember(Member m,
							   @RequestParam(value="emailAgree", defaultValue="N")String emailAgree,
							   HttpSession session) {
		m.setEmailAgree(emailAgree);
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		m.setMemberPwd(encPwd);
		if(memberService.signUpMember(m)>0) {
			Member mImg = memberService.loginMember(m);
			mImg.setMemberOriginName("basicProfile.jpg");
			mImg.setMemberFilePath("resources/memberUpfiles/");
			memberService.insertProfile(mImg);
			session.setAttribute("alertMsg", "회원가입을 축하합니다!");
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패하셨습니다.");
		}
		return "redirect:/";
	}
	
	/**
	 * 마이페이지url을 정확하게 알려주지 않기 위해서 거쳐서 보내줌
	 * @return : myInfoUpdate.jsp로 보냄
	 */
	@RequestMapping("myPage.me")
	public String myPageMember() {
		return "member/myInfoUpdate";
	}
	
	@RequestMapping("updateInfo.me")
	public void updateInfoMember(Member m) {
		System.out.println(m);
	}
	
	@RequestMapping("updateProfile.me")
	public void updateProfileMember(Member m) {
		
	}
	
	
//	public String saveFile(MultipartFile upfile, HttpSession session) {
//		String originName = upfile.getOriginalFilename();
//		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
//		int ranNum = (int)(Math.random() * 9000 + 10000);
//		String ext = originName.substring(originName.lastIndexOf("."));
//		String changeName = currentTime + ranNum + ext;
//		String savePath = session.getServletContext().getRealPath("/resources/memberUpfiles/");
//		MultipartFile upfile = (MultipartFile) new File(savePath + changeName);
//	}
}
