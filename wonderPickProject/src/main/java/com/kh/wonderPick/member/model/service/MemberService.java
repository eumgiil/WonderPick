package com.kh.wonderPick.member.model.service;

import com.kh.wonderPick.member.model.vo.Member;
import com.kh.wonderPick.member.model.vo.SecretCode;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int idCheckMember(String checkId);
	
	int nickCheckMember(String checkNick);

	int insertSecret(SecretCode secretCode);
	
	int signUpMember(Member m);
	
	int insertProfile(Member mImg);
	
	int codeCheckMember(String emailCode);
}
