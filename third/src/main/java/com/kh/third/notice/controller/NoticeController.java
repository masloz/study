package com.kh.third.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.third.notice.model.service.NoticeService;
import com.kh.third.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public String noticeListView(Model model){
		ArrayList<Notice> list = noticeService.selectList();
		if(list != null){
			model.addAttribute("list", list);
		}
		return "notice/noticeListView";
	}
}
