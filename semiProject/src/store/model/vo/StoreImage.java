package store.model.vo;

public class StoreImage {
	private int storeNum;
	private String imgMain;
	private String img1;
	private String img2;
	private String img3;
	
	public StoreImage() {}

	public StoreImage(int storeNum, String imgMain, String img1, String img2, String img3) {
		super();
		this.storeNum = storeNum;
		this.imgMain = imgMain;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
	}

	public int getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}

	public String getImgMain() {
		return imgMain;
	}

	public void setImgMain(String imgMain) {
		this.imgMain = imgMain;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	@Override
	public String toString() {
		return "StoreImage [storeNum=" + storeNum + ", imgMain=" + imgMain + ", img1=" + img1 + ", img2=" + img2
				+ ", img3=" + img3 + "]";
	}
	
}
