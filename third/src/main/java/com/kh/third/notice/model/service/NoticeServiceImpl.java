package com.kh.third.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.third.notice.model.dao.NoticeDao;
import com.kh.third.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	public NoticeServiceImpl(){}
	
	@Override
	public ArrayList<Notice> selectList() {
		return noticeDao.selectList();
	}

}
