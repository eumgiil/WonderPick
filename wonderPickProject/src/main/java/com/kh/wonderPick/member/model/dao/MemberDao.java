package com.kh.wonderPick.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

}
