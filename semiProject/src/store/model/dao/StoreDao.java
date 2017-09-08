package store.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import store.model.vo.Store;
import store.model.vo.StoreImage;

public class StoreDao {

	public ArrayList<Store> selectList(Connection con) {
		// 모든 음식점 목록 조회
		ArrayList<Store> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

//		String query = "SELECT * FROM STORE";
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, T.* FROM (SELECT * FROM STORE) T) WHERE RNUM < 7";

		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Store>();
				while (rset.next()) {

					Store s = new Store();

//					s.setStoreId(rset.getString("STORE_ID"));
//					s.setStorePwd(rset.getString("STORE_PWD"));
					s.setStoreNum(rset.getInt("STORE_NUM"));
					s.setStoreName(rset.getString("STORE_NAME"));
					s.setPhone(rset.getString("PHONE"));
					s.setCategory(rset.getString("CATEGORY"));
//					s.setCeo(rset.getString("CEO"));
					s.setAddress(rset.getString("ADDRESS"));
					s.setQr(rset.getString("QR"));
//					s.setStoreSerial(rset.getString("STORE_SERIAL"));
//					s.setHomepage(rset.getString("HOMEPAGE"));
//					s.setStoreIntro(rset.getString("STORE_INTRO"));
//					s.setStoreOriginInfo(rset.getString("STORE_ORIGIN_INFO"));
//					s.setStoreNotice(rset.getString("STORE_NOTICE"));
//					s.setStoreJoinDate(rset.getDate("STORE_JOIN_DATE"));
//					s.setStoreBusinessTime(rset.getString("STORE_BUSINESS_TIME"));
//					s.setStoreMinPrice(rset.getInt("STORE_MIN_PRICE"));

					list.add(s);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<Store> selectCategoryList(Connection con, String category) {
		// 카테고리별 음식점 목록 조회
		ArrayList<Store> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * FROM STORE WHERE CATEGORY = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Store>();
				while (rset.next()) {

					Store s = new Store();

//					s.setStoreId(rset.getString("STORE_ID"));
//					s.setStorePwd(rset.getString("STORE_PWD"));
					s.setStoreNum(rset.getInt("STORE_NUM"));
					s.setStoreName(rset.getString("STORE_NAME"));
					s.setPhone(rset.getString("PHONE"));
					s.setCategory(rset.getString("CATEGORY"));
//					s.setCeo(rset.getString("CEO"));
					s.setAddress(rset.getString("ADDRESS"));
					s.setQr(rset.getString("QR"));
//					s.setStoreSerial(rset.getString("STORE_SERIAL"));
//					s.setHomepage(rset.getString("HOMEPAGE"));
//					s.setStoreIntro(rset.getString("STORE_INTRO"));
//					s.setStoreOriginInfo(rset.getString("STORE_ORIGIN_INFO"));
//					s.setStoreNotice(rset.getString("STORE_NOTICE"));
//					s.setStoreJoinDate(rset.getDate("STORE_JOIN_DATE"));
//					s.setStoreBusinessTime(rset.getString("STORE_BUSINESS_TIME"));
//					s.setStoreMinPrice(rset.getInt("STORE_MIN_PRICE"));

					list.add(s);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public Store selectOne(Connection con, int storeNum) {
		Store store = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * FROM STORE WHERE STORE_NUM = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				if (rset.next()) {
					store = new Store();
					
					store.setStoreId(rset.getString("STORE_ID"));
					store.setStorePwd(rset.getString("STORE_PWD"));
					store.setStoreNum(rset.getInt("STORE_NUM"));
					store.setStoreName(rset.getString("STORE_NAME"));
					store.setPhone(rset.getString("PHONE"));
					store.setCategory(rset.getString("CATEGORY"));
					store.setCeo(rset.getString("CEO"));
					store.setAddress(rset.getString("ADDRESS"));
					store.setQr(rset.getString("QR"));
					store.setStoreSerial(rset.getString("STORE_SERIAL"));
					store.setHomepage(rset.getString("HOMEPAGE"));
					store.setStoreIntro(rset.getString("STORE_INTRO"));
					store.setStoreOriginInfo(rset.getString("STORE_ORIGIN_INFO"));
					store.setStoreNotice(rset.getString("STORE_NOTICE"));
//					store.setStoreJoinDate(rset.getDate("STORE_JOIN_DATE"));
					store.setStoreBusinessTime(rset.getString("STORE_BUSINESS_TIME"));
					store.setStoreMinPrice(rset.getInt("STORE_MIN_PRICE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return store;
	}
	
	public Store selectOne(Connection con, String storeId, String storePwd) {
		Store store = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * FROM STORE WHERE STORE_Id = ? AND STORE_PWD = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, storeId);
			pstmt.setString(2, storePwd);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				if (rset.next()) {
					store = new Store();
					
					store.setStoreId(rset.getString("STORE_ID"));
					store.setStorePwd(rset.getString("STORE_PWD"));
					store.setStoreNum(rset.getInt("STORE_NUM"));
					store.setStoreName(rset.getString("STORE_NAME"));
					store.setPhone(rset.getString("PHONE"));
					store.setCategory(rset.getString("CATEGORY"));
					store.setCeo(rset.getString("CEO"));
					store.setAddress(rset.getString("ADDRESS"));
					store.setQr(rset.getString("QR"));
					store.setStoreSerial(rset.getString("STORE_SERIAL"));
					store.setHomepage(rset.getString("HOMEPAGE"));
					store.setStoreIntro(rset.getString("STORE_INTRO"));
					store.setStoreOriginInfo(rset.getString("STORE_ORIGIN_INFO"));
					store.setStoreNotice(rset.getString("STORE_NOTICE"));
//					store.setStoreJoinDate(rset.getDate("STORE_JOIN_DATE"));
					store.setStoreBusinessTime(rset.getString("STORE_BUSINESS_TIME"));
					store.setStoreMinPrice(rset.getInt("STORE_MIN_PRICE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return store;
	}
	
	
	public int insertStore(Connection con, Store s) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "INSERT INTO STORE VALUES(?, ?, (SELECT MAX(STORE_NUM) FROM STORE) + 1, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getStoreId());
			pstmt.setString(2, s.getStorePwd());
			pstmt.setString(3, s.getStoreName());
			pstmt.setString(4, s.getPhone());
			pstmt.setString(5, s.getCategory());
			pstmt.setString(6, s.getCeo());
			pstmt.setString(7, s.getAddress());
			pstmt.setString(8, s.getQr());
			pstmt.setString(9, s.getStoreSerial());
			pstmt.setString(10, s.getHomepage());
			pstmt.setString(11, s.getStoreIntro());
			pstmt.setString(12, s.getStoreOriginInfo());
			pstmt.setString(13, s.getStoreNotice());
//			pstmt.setDate(14, s.getStoreJoinDate());
			pstmt.setString(14, s.getStoreBusinessTime());
			pstmt.setInt(15, s.getStoreMinPrice());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteStore(Connection con, int storeNum) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "DELETE FROM STORE WHERE STORE_NUM = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateStore(Connection con, Store s) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "UPDATE STORE SET STORE_NAME = ?, STORE_SERIAL = ?, CEO = ?, PHONE = ?, ADDRESS = ?, CATEGORY = ?, QR = ?, HOMEPAGE = ?, STORE_NOTICE = ?, STORE_INTRO = ?, STORE_ORIGIN_INFO = ?, STORE_BUSINESS_TIME = ?, STORE_MIN_PRICE = ? WHERE STORE_ID = ?";

		try {
			pstmt = con.prepareStatement(query);
//			pstmt.setString(2, s.getStorePwd());
			
			pstmt.setString(1, s.getStoreName());
			pstmt.setString(2, s.getStoreSerial());
			pstmt.setString(3, s.getCeo());
			pstmt.setString(4, s.getPhone());
			pstmt.setString(5, s.getAddress());
			pstmt.setString(6, s.getCategory());
			pstmt.setString(9, s.getQr());
			pstmt.setString(10, s.getHomepage());
			pstmt.setString(11, s.getStoreNotice());
			pstmt.setString(12, s.getStoreIntro());
			pstmt.setString(13, s.getStoreOriginInfo());
			pstmt.setString(14, s.getStoreBusinessTime());
			pstmt.setInt(15, s.getStoreMinPrice());
			pstmt.setString(16, s.getStoreId());
			
			
//			pstmt.setDate(15, s.getStoreJoinDate());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Store> selectSearchList(Connection con, String keyword) {
		ArrayList<Store> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * FROM STORE WHERE STORE_NAME LIKE ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Store>();
				while (rset.next()) {

					Store s = new Store();

//					s.setStoreId(rset.getString("STORE_ID"));
//					s.setStorePwd(rset.getString("STORE_PWD"));
					s.setStoreNum(rset.getInt("STORE_NUM"));
					s.setStoreName(rset.getString("STORE_NAME"));
					s.setPhone(rset.getString("PHONE"));
//					s.setCategory(rset.getString("CATEGORY"));
//					s.setCeo(rset.getString("CEO"));
					s.setAddress(rset.getString("ADDRESS"));
					s.setQr(rset.getString("QR"));
//					s.setStoreSerial(rset.getString("STORE_SERIAL"));
//					s.setHomepage(rset.getString("HOMEPAGE"));
//					s.setStoreIntro(rset.getString("STORE_INTRO"));
//					s.setStoreOriginInfo(rset.getString("STORE_ORIGIN_INFO"));
//					s.setStoreNotice(rset.getString("STORE_NOTICE"));
//					s.setStoreJoinDate(rset.getDate("STORE_JOIN_DATE"));
//					s.setStoreBusinessTime(rset.getString("STORE_BUSINESS_TIME"));
//					s.setStoreMinPrice(rset.getInt("STORE_MIN_PRICE"));

					list.add(s);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public String idCheck(Connection con, String storeId) {
		String result = " ";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT STORE_ID FROM STORE WHERE STORE_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, storeId);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("STORE_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Store> selectListMore(Connection con, int page, String category) {
		ArrayList<Store> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

//		String query = "SELECT * FROM STORE";
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, T.* FROM (SELECT * FROM STORE) T) WHERE RNUM > ? AND RNUM < ?";
		if(!category.equals("전체메뉴")) {
			query += "AND CATEGORY = ?";
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, page * 6);
			pstmt.setInt(2, (page + 1) * 6 + 1);
			if(!category.equals("전체메뉴")) {
				pstmt.setString(3, category);
			}
			
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Store>();
				while (rset.next()) {

					Store s = new Store();

//					s.setStoreId(rset.getString("STORE_ID"));
//					s.setStorePwd(rset.getString("STORE_PWD"));
					s.setStoreNum(rset.getInt("STORE_NUM"));
					s.setStoreName(rset.getString("STORE_NAME"));
					s.setPhone(rset.getString("PHONE"));
					s.setCategory(rset.getString("CATEGORY"));
//					s.setCeo(rset.getString("CEO"));
					s.setAddress(rset.getString("ADDRESS"));
					s.setQr(rset.getString("QR"));
//					s.setStoreSerial(rset.getString("STORE_SERIAL"));
//					s.setHomepage(rset.getString("HOMEPAGE"));
//					s.setStoreIntro(rset.getString("STORE_INTRO"));
//					s.setStoreOriginInfo(rset.getString("STORE_ORIGIN_INFO"));
//					s.setStoreNotice(rset.getString("STORE_NOTICE"));
//					s.setStoreJoinDate(rset.getDate("STORE_JOIN_DATE"));
//					s.setStoreBusinessTime(rset.getString("STORE_BUSINESS_TIME"));
//					s.setStoreMinPrice(rset.getInt("STORE_MIN_PRICE"));

					list.add(s);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public int insertImage(Connection con, int storeNum) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "INSERT INTO IMAGE VALUES(?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			pstmt.setString(2, null);
			pstmt.setString(3, null);
			pstmt.setString(4, null);
			pstmt.setString(5, null);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public StoreImage selectStoreImg(Connection con, int storeNum) {
		StoreImage simg = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * FROM IMAGE WHERE STORE_NUM = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				if (rset.next()) {
					simg = new StoreImage();
					
					simg.setStoreNum(rset.getInt("STORE_NUM"));
					simg.setImgMain(rset.getString("IMG_MAIN"));
					simg.setImg1(rset.getString("IMG1"));
					simg.setImg2(rset.getString("IMG2"));
					simg.setImg3(rset.getString("IMG3"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return simg;
	}

	public int updateImage(Connection con, StoreImage simg, String renameFileName) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "UPDATE IMAGE SET ";
		if(simg.getImgMain() != null) {
			query += "IMG_MAIN = ? WHERE STORE_NUM = ?";
		}else if(simg.getImg1() != null) {
			query += "IMG1 = ? WHERE STORE_NUM = ?";
		}else if(simg.getImg2() != null) {
			query += "IMG2 = ? WHERE STORE_NUM = ?";
		}else if(simg.getImg3() != null){
			query += "IMG3 = ? WHERE STORE_NUM = ?"; 
		}
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, renameFileName);
			pstmt.setInt(2, simg.getStoreNum());
			
//			pstmt.setString(1, simg.getImgMain());
//			pstmt.setString(2, simg.getImg1());
//			pstmt.setString(3, simg.getImg2());
//			pstmt.setString(4, simg.getImg3());
//			pstmt.setInt(5, simg.getStoreNum());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteImg(Connection con, String img, String renameImg, int storeNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		if(renameImg.equals("main")) {
			query = "UPDATE IMAGE SET IMG_MAIN = NULL WHERE STORE_NUM = ?";
		}else if(renameImg.equals("img1")) {
			query = "UPDATE IMAGE SET IMG1 = NULL WHERE STORE_NUM = ?";
		}else if(renameImg.equals("img2")) {
			query = "UPDATE IMAGE SET IMG2 = NULL WHERE STORE_NUM = ?";
		}else if(renameImg.equals("img3")) {
			query = "UPDATE IMAGE SET IMG3 = NULL WHERE STORE_NUM = ?";
		}
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	

}
