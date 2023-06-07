package com.kh.wonderPick.member.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.member.model.vo.Member;

public interface MemberService {
	
	public Member loginMember(Member m);
	
	//회원 전체조회
	int selectListCount();
	//회원 전체조회
	ArrayList<Member> selectMemberList(PageInfo pi);
}
