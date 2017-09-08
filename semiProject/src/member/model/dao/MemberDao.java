package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static common.JDBCTemplate.*;

import member.model.vo.Member;

public class MemberDao {
	public MemberDao(){
		
	}

	public Member selectMember(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = "select user_id, user_pwd, user_name, user_num from member where user_id = ? and user_pwd = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				System.out.println(userId+" "+userPwd+" " + rset.getString("user_name"));
				m = new Member(rset.getInt("user_num"), userId,rset.getString("user_name"),userPwd);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

}
