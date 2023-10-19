package com.kh.order.model.vo;

public class Store {

	
	private int storeId;
	private String storeName;
	private String storeAddress;
	private String Latitude;
	private String longitude;
	
	public Store() {
		
	}
	
	
	public Store(int storeId, String storeName, String storeAddress, String storePhone, String storeUrl,
			String latitude, String longitude) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.storeAddress = storeAddress;
		Latitude = latitude;
		this.longitude = longitude;
	}


	public int getStoreId() {
		return storeId;
	}


	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getStoreAddress() {
		return storeAddress;
	}


	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}



	public String getLatitude() {
		return Latitude;
	}


	public void setLatitude(String latitude) {
		Latitude = latitude;
	}


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName + ", storeAddress=" + storeAddress
				 + ", Latitude=" + Latitude + ", longitude="
				+ longitude + "]";
	}
	
}
	
	
