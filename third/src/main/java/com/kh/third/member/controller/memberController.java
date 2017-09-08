package com.kh.third.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.third.member.model.service.MemberService;
import com.kh.third.member.model.vo.Member;

@Controller
public class memberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginCheck(Member m, HttpSession session){
		Member member = memberService.loginMember(m);
		if(member != null){
			session.setAttribute("member", member);
		}
		return "home";
	}
	
	@RequestMapping(value = "enroll.do", method = RequestMethod.GET)
	public String insertNoticeForm() {
		return "member/enroll";
	}
	
}
