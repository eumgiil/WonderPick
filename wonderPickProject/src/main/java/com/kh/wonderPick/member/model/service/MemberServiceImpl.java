package com.kh.wonderPick.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.member.model.dao.MemberDao;
import com.kh.wonderPick.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(m, sqlSession);
	}
	//회원 전체조회
	@Override
	public int selectListCount() {
		return memberDao.selectListCount(sqlSession);
	}
	
	//회원 전체조회
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return memberDao.selectMemberList(sqlSession,pi);
	}
	
}
