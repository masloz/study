package reply.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import reply.model.dao.ReplyDao;
import reply.model.vo.Reply;

public class ReplyService {
	public ReplyService(){
		
	}

/*	public ArrayList<Reply> replyStoreList() {
		Connection con = getConnection();
		ArrayList<Reply> list = new ReplyDao().replyStoreList(con);
		close(con);
		return null;
	}*/
	
	public ArrayList<Reply> replyDetail(int storeNo, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Reply> list = new ReplyDao().replyDetail(con, storeNo, currentPage, limit);
		close(con);
		return list;
	}
	
	public ArrayList<Reply> replyDetail(int storeNo) {
		Connection con = getConnection();
		ArrayList<Reply> list = new ReplyDao().replyDetail(con, storeNo);
		close(con);
		return list;
	}

	public int insertReply(Reply r) {
		Connection con = getConnection();
		int result = new ReplyDao().insertReply(con, r);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int deleteReply(int replyNum) {
		Connection con = getConnection();
		int result = new ReplyDao().deleteReply(con, replyNum);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int goodUpdate(int rNum) {
		Connection con = getConnection();
		int result = new ReplyDao().goodUpdate(con, rNum);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ReplyDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<Reply> recentTop5(String userId) {
		Connection con = getConnection();
		ArrayList<Reply> list = new ReplyDao().recentTop5(con, userId);
		close(con);
		return list;
	}
	
	public ArrayList<Reply> myReply(String userId) {
		Connection con = getConnection();
		ArrayList<Reply> list = new ReplyDao().myReply(con, userId);
		close(con);
		return list;
	}

}
