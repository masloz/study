package good.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import good.model.vo.Good;

public class GoodDao {
	public GoodDao(){
		
	}

	public int insertGood(Connection con, int rNum, int uNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into good values(?, ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rNum);
			pstmt.setInt(2, uNum);

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Good selectGood(Connection con, int rNum, int uNum) {
		Good good = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from good where reply_num = ? and user_num = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rNum);
			pstmt.setInt(2, uNum);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				good = new Good();

				good.setrNum(rNum);
				good.setuNum(uNum);
	
			} 
			
		} catch (Exception e) {
			e.printStackTrace();			
		} finally {
			close(rset);
			close(pstmt);
		}

		return good;
	}

}
