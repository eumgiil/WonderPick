package com.kh.wonderPick.member.model.service;

import com.kh.wonderPick.member.model.vo.Member;

public interface MemberService {
	
	public Member loginMember(Member m);
	
	public int idCheckMember(String checkId);
	
	public int nickCheckMember(String checkNick);
	
	public int signUpMember(Member m);
}
