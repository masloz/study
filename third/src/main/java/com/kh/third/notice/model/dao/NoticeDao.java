package com.kh.third.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.third.notice.model.vo.Notice;


@Repository("NoticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDao(){}
	
	public ArrayList<Notice> selectList(){
		List<Notice> list = sqlSession.selectList("Notice.selectAll");
		return (ArrayList<Notice>)list;
	}
}
