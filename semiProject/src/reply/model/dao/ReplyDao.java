package reply.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import reply.model.vo.Reply;

public class ReplyDao {
	public ReplyDao(){
		
	}

	public ArrayList<Reply> replyStoreList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = "select * from reply";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<Reply>();
				while(rset.next()){
					list.add(new Reply(
							rset.getInt("reply_num"),
							rset.getInt("store_num"),
							rset.getString("user_id"),
							rset.getString("content"),
							rset.getInt("point"),
							rset.getDate("reply_date"),
							rset.getInt("good")
							));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	public ArrayList<Reply> replyDetail(Connection con, int storeNo, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, T.* FROM (SELECT * FROM REPLY WHERE STORE_NUM = ? ORDER BY REPLY_NUM DESC) T) where rnum >= ? and rnum <= ?";
		
		/*String query = "select * from (select * from reply where store_num = ? order by reply_num desc) where rnum >= ? and rnum <= ?";*/
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
					list = new ArrayList<Reply>();
					while (rset.next()) {
					Reply reply = new Reply();
					
					reply.setReplyNum(rset.getInt("reply_num"));
					reply.setStoreNum(storeNo);
					reply.setUserId(rset.getString("user_id"));
					reply.setContent(rset.getString("content"));
					reply.setPoint(rset.getInt("point"));
					reply.setReplyDate(rset.getDate("reply_date"));
					reply.setGood(rset.getInt("good"));
					list.add(reply);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Reply> replyDetail(Connection con, int storeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = "SELECT ROWNUM RNUM, T.* FROM (SELECT * FROM REPLY WHERE STORE_NUM = ? ORDER BY REPLY_NUM DESC) T";
		
		/*String query = "select * from (select * from reply where store_num = ? order by reply_num desc) where rnum >= ? and rnum <= ?";*/
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNo);
			
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
					list = new ArrayList<Reply>();
					while (rset.next()) {
					Reply reply = new Reply();
					
					reply.setReplyNum(rset.getInt("reply_num"));
					reply.setStoreNum(storeNo);
					reply.setUserId(rset.getString("user_id"));
					reply.setContent(rset.getString("content"));
					reply.setPoint(rset.getInt("point"));
					reply.setReplyDate(rset.getDate("reply_date"));
					reply.setGood(rset.getInt("good"));
					list.add(reply);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertReply(Connection con, Reply r) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into reply values((select max(reply_num) + 1 from reply), ?, ?, ?, ?, sysdate, default)";

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, r.getStoreNum());
				pstmt.setString(2, r.getUserId());
				pstmt.setString(3, r.getContent());
				pstmt.setInt(4, r.getPoint());

				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}

	public int deleteReply(Connection con, int replyNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from reply where reply_num = ?";
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, replyNum);

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int goodUpdate(Connection con, int rNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = 
		"update reply set good = good + 1 where reply_num = ? ";
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rNum);

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from reply";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
				// select 절의 첫번째 항목을 뜻함
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Reply> recentTop5(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = "select * from (select * from reply where user_id = ? order by reply_date desc) where rownum < 6;";
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
					list = new ArrayList<Reply>();
					while (rset.next()) {
					Reply reply = new Reply();
					
					reply.setReplyNum(rset.getInt("reply_num"));
					reply.setStoreNum(rset.getInt("store_num"));
					reply.setUserId(userId);
					reply.setContent(rset.getString("content"));
					reply.setPoint(rset.getInt("point"));
					reply.setReplyDate(rset.getDate("reply_date"));
					reply.setGood(rset.getInt("good"));
					list.add(reply);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Reply> myReply(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = "select * from reply where user_id = ? order by reply_date desc";
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
					list = new ArrayList<Reply>();
					while (rset.next()) {
					Reply reply = new Reply();
					
					reply.setReplyNum(rset.getInt("reply_num"));
					reply.setStoreNum(rset.getInt("store_num"));
					reply.setUserId(userId);
					reply.setContent(rset.getString("content"));
					reply.setPoint(rset.getInt("point"));
					reply.setReplyDate(rset.getDate("reply_date"));
					reply.setGood(rset.getInt("good"));
					list.add(reply);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
