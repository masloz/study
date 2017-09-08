package com.kh.third.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.third.member.model.dao.MemberDao;
import com.kh.third.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	public MemberServiceImpl (){}
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.selectMember(m);
	}
	
}
