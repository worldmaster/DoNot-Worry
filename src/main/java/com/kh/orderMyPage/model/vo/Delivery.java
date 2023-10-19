package com.kh.orderMyPage.model.vo;

import java.sql.Date;

public class Delivery {
	
	private int deliveryNo;
	private String receiverName;
	private String receiverPhone;
	private String receiverAddress;
	private String MSG;
	private String deliveryStatus;
	private Date deliveryDate;
	
	
	public Delivery() {
		
	}


	public Delivery(int deliveryNo, String receiverName, String receiverPhone, String receiverAddress, String mSG,
			String deliveryStatus, Date deliveryDate) {
		super();
		this.deliveryNo = deliveryNo;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.receiverAddress = receiverAddress;
		MSG = mSG;
		this.deliveryStatus = deliveryStatus;
		this.deliveryDate = deliveryDate;
	}


	public int getDeliveryNo() {
		return deliveryNo;
	}


	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}


	public String getReceiverName() {
		return receiverName;
	}


	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}


	public String getReceiverPhone() {
		return receiverPhone;
	}


	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}


	public String getReceiverAddress() {
		return receiverAddress;
	}


	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}


	public String getMSG() {
		return MSG;
	}


	public void setMSG(String mSG) {
		MSG = mSG;
	}


	public String getDeliveryStatus() {
		return deliveryStatus;
	}


	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}


	public Date getDeliveryDate() {
		return deliveryDate;
	}


	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}


	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", receiverName=" + receiverName + ", receiverPhone="
				+ receiverPhone + ", receiverAddress=" + receiverAddress + ", MSG=" + MSG + ", deliveryStatus="
				+ deliveryStatus + ", deliveryDate=" + deliveryDate + "]";
	}
	
	
	
	
	
	
	
}
