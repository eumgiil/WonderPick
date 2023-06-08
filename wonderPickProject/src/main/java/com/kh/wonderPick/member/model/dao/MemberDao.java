package com.kh.wonderPick.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int idCheckMember(String CheckId, SqlSessionTemplate sqlSession) {
		return 0;
	}
}
