package com.kh.wonderPick.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.member.model.vo.Member;
import com.kh.wonderPick.member.model.vo.MemberImage;
import com.kh.wonderPick.member.model.vo.SecretCode;

@Repository
public class MemberDao {
	
	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int idCheckMember(String checkId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.idCheckMember", checkId);
	}
	
	public int nickCheckMember(String checkNick, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.nickCheckMember", checkNick);
	}
	
	public int signUpMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.signUpMember", m);
	}
	
	public int insertSecret(SecretCode secretCode, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertSecret", secretCode);
	}
	
	public boolean codeCheckMember(SecretCode secretCode, SqlSessionTemplate sqlSession) {
		SecretCode result = sqlSession.selectOne("memberMapper.codeCheckMember", secretCode);
		
		if(result != null) {
			sqlSession.delete("memberMapper.removeCode", secretCode);
		}
		return result != null;
	}
	
	public int insertProfile(Member mImg, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertProfile", mImg);
	}
}
