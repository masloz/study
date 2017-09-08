package store.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Store implements Serializable{
	private String storeId;
	private String storePwd;
	private int storeNum;
	private String storeName;
	private String phone;
	private String category;
	private String ceo;
	private String address;
	private String qr;
	private String storeSerial;
	private String homepage;
	private String storeIntro;
	private String storeOriginInfo;
	private String storeNotice;
	private Date storeJoinDate;
	private String storeBusinessTime;
	private int storeMinPrice;
	
	
	public Store(){}


	public Store(String storeId, String storePwd, int storeNum, String storeName, String phone, String category,
			String ceo, String address, String qr, String storeSerial, String homepage, String storeIntro,
			String storeOriginInfo, String storeNotice, Date storeJoinDate, String storeBusinessTime,
			int storeMinPrice) {
		super();
		this.storeId = storeId;
		this.storePwd = storePwd;
		this.storeNum = storeNum;
		this.storeName = storeName;
		this.phone = phone;
		this.category = category;
		this.ceo = ceo;
		this.address = address;
		this.qr = qr;
		this.storeSerial = storeSerial;
		this.homepage = homepage;
		this.storeIntro = storeIntro;
		this.storeOriginInfo = storeOriginInfo;
		this.storeNotice = storeNotice;
		this.storeJoinDate = storeJoinDate;
		this.storeBusinessTime = storeBusinessTime;
		this.storeMinPrice = storeMinPrice;
	}
	
	


	public Store(String storeId, String storePwd, String storeName, String phone, String category, String ceo,
			String address, String qr, String storeSerial, String homepage, String storeIntro,
			String storeOriginInfo, String storeNotice, String storeBusinessTime, int storeMinPrice) {
		super();
		this.storeId = storeId;
		this.storePwd = storePwd;
		this.storeName = storeName;
		this.phone = phone;
		this.category = category;
		this.ceo = ceo;
		this.address = address;
		this.qr = qr;
		this.storeSerial = storeSerial;
		this.homepage = homepage;
		this.storeIntro = storeIntro;
		this.storeOriginInfo = storeOriginInfo;
		this.storeNotice = storeNotice;
		this.storeBusinessTime = storeBusinessTime;
		this.storeMinPrice = storeMinPrice;
	}
	
	public Store(String storeId, String storeName, String phone, String category, String ceo,
			String address, String qr, String storeSerial, String homepage, String storeIntro,
			String storeOriginInfo, String storeNotice, String storeBusinessTime, int storeMinPrice) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.phone = phone;
		this.category = category;
		this.ceo = ceo;
		this.address = address;
		this.qr = qr;
		this.storeSerial = storeSerial;
		this.homepage = homepage;
		this.storeIntro = storeIntro;
		this.storeOriginInfo = storeOriginInfo;
		this.storeNotice = storeNotice;
		this.storeBusinessTime = storeBusinessTime;
		this.storeMinPrice = storeMinPrice;
	}


	public String getStoreId() {
		return storeId;
	}


	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}


	public String getStorePwd() {
		return storePwd;
	}


	public void setStorePwd(String storePwd) {
		this.storePwd = storePwd;
	}


	public int getStoreNum() {
		return storeNum;
	}


	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getCeo() {
		return ceo;
	}


	public void setCeo(String ceo) {
		this.ceo = ceo;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getQr() {
		return qr;
	}


	public void setQr(String qr) {
		this.qr = qr;
	}


	public String getStoreSerial() {
		return storeSerial;
	}


	public void setStoreSerial(String storeSerial) {
		this.storeSerial = storeSerial;
	}


	public String getHomepage() {
		return homepage;
	}


	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}


	public String getStoreIntro() {
		return storeIntro;
	}


	public void setStoreIntro(String storeIntro) {
		this.storeIntro = storeIntro;
	}


	public String getStoreOriginInfo() {
		return storeOriginInfo;
	}


	public void setStoreOriginInfo(String storeOriginInfo) {
		this.storeOriginInfo = storeOriginInfo;
	}


	public String getStoreNotice() {
		return storeNotice;
	}


	public void setStoreNotice(String storeNotice) {
		this.storeNotice = storeNotice;
	}


	public Date getStoreJoinDate() {
		return storeJoinDate;
	}


	public void setStoreJoinDate(Date storeJoinDate) {
		this.storeJoinDate = storeJoinDate;
	}


	public String getStoreBusinessTime() {
		return storeBusinessTime;
	}


	public void setStoreBusinessTime(String storeBusinessTime) {
		this.storeBusinessTime = storeBusinessTime;
	}


	public int getStoreMinPrice() {
		return storeMinPrice;
	}


	public void setStoreMinPrice(int storeMinPrice) {
		this.storeMinPrice = storeMinPrice;
	}


	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storePwd=" + storePwd + ", storeNum=" + storeNum + ", storeName="
				+ storeName + ", phone=" + phone + ", category=" + category + ", ceo=" + ceo + ", address=" + address
				+ ", qr=" + qr + ", storeSerial=" + storeSerial + ", homepage=" + homepage
				+ ", storeIntro=" + storeIntro + ", storeOriginInfo=" + storeOriginInfo + ", storeNotice=" + storeNotice
				+ ", storeJoinDate=" + storeJoinDate + ", storeBusinessTime=" + storeBusinessTime + ", storeMinPrice="
				+ storeMinPrice + "]";
	}

	
}
