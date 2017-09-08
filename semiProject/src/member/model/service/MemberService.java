package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	public MemberService(){
		
	}

	public Member selectMember(String userId, String userPwd) {
		Connection con = getConnection();
		Member m = new MemberDao().selectMember(con, userId, userPwd);
		close(con);
		return m;
	}
}
