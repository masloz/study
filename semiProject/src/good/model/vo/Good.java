package good.model.vo;

public class Good {
	private int rNum;
	private int uNum;
	
	public Good(){
		
	}

	public Good(int rNum, int uNum) {
		super();
		this.rNum = rNum;
		this.uNum = uNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getuNum() {
		return uNum;
	}

	public void setuNum(int uNum) {
		this.uNum = uNum;
	}

	@Override
	public String toString() {
		return "Good [rNum=" + rNum + ", uNum=" + uNum + "]";
	}

}
