package com.kh.wonderPick.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wonderPick.member.model.dao.MemberDao;
import com.kh.wonderPick.member.model.vo.Member;
import com.kh.wonderPick.member.model.vo.SecretCode;

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

	@Override
	public int nickCheckMember(String checkNick) {
		return memberDao.nickCheckMember(checkNick, sqlSession);
	}

	@Override
	public int signUpMember(Member m) {
		return memberDao.signUpMember(m, sqlSession);
	}

	@Override
	public void insertSecret(SecretCode secretCode) {
		memberDao.insertSecret(secretCode, sqlSession);
	}
}
