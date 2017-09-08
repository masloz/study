package reply.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNum;
	private int storeNum;
	private String userId;
	private String content;
	private int point;
	private Date replyDate;
	private int good;
	
	public Reply(){
		
	}

	public Reply(int replyNum, int storeNum, String userId, String content, int point, Date replyDate, int good) {
		super();
		this.replyNum = replyNum;
		this.storeNum = storeNum;
		this.userId = userId;
		this.content = content;
		this.point = point;
		this.replyDate = replyDate;
		this.good = good;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	@Override
	public String toString() {
		return "Reply [replyNum=" + replyNum + ", storeNum=" + storeNum + ", userId=" + userId + ", content=" + content
				+ ", point=" + point + ", replyDate=" + replyDate + ", good=" + good + "]";
	}

}
