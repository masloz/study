package good.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import good.model.dao.GoodDao;
import good.model.vo.Good;

public class GoodService {
	public GoodService(){
		
	}

	public int insertGood(int rNum, int uNum) {
		Connection con = getConnection();
		int result = new GoodDao().insertGood(con, rNum, uNum);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public Good selectGood(int rNum, int uNum) {
		Connection con = getConnection();
		Good good = new GoodDao().selectGood(con, rNum, uNum);
		close(con);
		return good;
	}

}
