package member.model.vo;

import java.sql.Date;

public class Member {
	private int userNum;
	private String userId;
	private String userPhone;
	private String userName;
	private String userPwd;
	private String email;
	private int birth;
	private Date enrollDate;
	private String gender;
	private int verse;
	
	public Member(){
		
	}

	
	public Member(int userNum, String userId, String userName, String userPwd) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
	}


	public Member(int userNum, String userId, String userPhone, String userName, String userPwd, String email,
			int birth, Date enrollDate, String gender, int verse) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPhone = userPhone;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.gender = gender;
		this.verse = verse;
	}


	public int getUserNum() {
		return userNum;
	}


	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getBirth() {
		return birth;
	}


	public void setBirth(int birth) {
		this.birth = birth;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getVerse() {
		return verse;
	}


	public void setVerse(int verse) {
		this.verse = verse;
	}


	@Override
	public String toString() {
		return "Member [userNum=" + userNum + ", userId=" + userId + ", userPhone=" + userPhone + ", userName="
				+ userName + ", userPwd=" + userPwd + ", email=" + email + ", birth=" + birth + ", enrollDate="
				+ enrollDate + ", gender=" + gender + ", verse=" + verse + "]";
	}

	

}
