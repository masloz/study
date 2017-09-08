package store.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import store.model.dao.StoreDao;
import store.model.vo.Store;
import store.model.vo.StoreImage;

public class StoreService {
	public StoreService() {
	}

	public ArrayList<Store> selectList() { // + current, limit
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectList(con);

		close(con);
		return list;
	}

	public ArrayList<Store> selectCategoryList(String category) { // + current,
																	// limit
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectCategoryList(con, category);

		close(con);
		return list;
	}

	public Store selectOne(int storeNum) {
		Connection con = getConnection();

		Store store = new StoreDao().selectOne(con, storeNum);

		close(con);
		return store;
	}
	
	public Store selectOne(String storeId, String storePwd) {
		Connection con = getConnection();

		Store store = new StoreDao().selectOne(con, storeId, storePwd);

		close(con);
		return store;
	}
	
	public int insertStore(Store store) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().insertStore(con, store);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int deleteStore(int storeNum) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().deleteStore(con, storeNum);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int updateStore(Store store) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().updateStore(con, store);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public ArrayList<Store> selectSearchList(String keyword) {
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectSearchList(con, keyword);

		close(con);
		return list;
	}

	public String idCheck(String storeId) {
		Connection con = getConnection();
		String result = new StoreDao().idCheck(con, storeId);
		close(con);
		return result;
	}

	public String nullCheck(String str) {
		if (str == null || str.length() == 0) {
			str = "";
		}
		return str;
	}

	public ArrayList<Store> selectListMore(int page, String category) {
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectListMore(con, page, category);

		close(con);
		return list;
	}

	
//	IAMGE
	public int insertImage(int storeNum) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().insertImage(con, storeNum);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public StoreImage selectStoreImg(int storeNum) {
		Connection con = getConnection();

		StoreImage simg = new StoreDao().selectStoreImg(con, storeNum);

		close(con);
		return simg;
	}

	public int updateImage(StoreImage simg, String renameFileName) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().updateImage(con, simg, renameFileName);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int deleteImg(String img, String renameImg, int storeNum) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().deleteImg(con, img, renameImg, storeNum);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
}
