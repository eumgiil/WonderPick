package com.kh.wonderPick.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public int idCheckMember(String checkId) {
		return memberDao.idCheckMember(checkId, sqlSession);
	}

}
