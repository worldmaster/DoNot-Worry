package com.kh.orderMyPage.model.vo;

public class StoreMyPage {

	private int stId;
	private String stName;
	private String stAddress;
	private String stPhone;
	private String URL;
	private double LATITUDE;
	private double LONGITUDE;
	
	
	
	public StoreMyPage() {
		
	}
	
	



	public StoreMyPage(int stId, String stName) {
		super();
		this.stId = stId;
		this.stName = stName;
	}





	public StoreMyPage(int stId, String stName, String stAddress, String stPhone, String uRL, double lATITUDE,
			double lONGITUDE) {
		super();
		this.stId = stId;
		this.stName = stName;
		this.stAddress = stAddress;
		this.stPhone = stPhone;
		URL = uRL;
		LATITUDE = lATITUDE;
		LONGITUDE = lONGITUDE;
	}



	public int getStId() {
		return stId;
	}



	public void setStId(int stId) {
		this.stId = stId;
	}



	public String getStName() {
		return stName;
	}



	public void setStName(String stName) {
		this.stName = stName;
	}



	public String getStAddress() {
		return stAddress;
	}



	public void setStAddress(String stAddress) {
		this.stAddress = stAddress;
	}



	public String getStPhone() {
		return stPhone;
	}



	public void setStPhone(String stPhone) {
		this.stPhone = stPhone;
	}



	public String getURL() {
		return URL;
	}



	public void setURL(String uRL) {
		URL = uRL;
	}



	public double getLATITUDE() {
		return LATITUDE;
	}



	public void setLATITUDE(double lATITUDE) {
		LATITUDE = lATITUDE;
	}



	public double getLONGITUDE() {
		return LONGITUDE;
	}



	public void setLONGITUDE(double lONGITUDE) {
		LONGITUDE = lONGITUDE;
	}



	@Override
	public String toString() {
		return "Store [stId=" + stId + ", stName=" + stName + ", stAddress=" + stAddress + ", stPhone=" + stPhone
				+ ", URL=" + URL + ", LATITUDE=" + LATITUDE + ", LONGITUDE=" + LONGITUDE + ", getStId()=" + getStId()
				+ ", getStName()=" + getStName() + ", getStAddress()=" + getStAddress() + ", getStPhone()="
				+ getStPhone() + ", getURL()=" + getURL() + ", getLATITUDE()=" + getLATITUDE() + ", getLONGITUDE()="
				+ getLONGITUDE() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
}
