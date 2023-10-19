package com.kh.orderMyPage.model.vo;

import java.sql.Date;

public class OrderMyPage {
	
	private long orederNo;
	private int UserNo;
	private Date orderDate;
	private String orderWay;
	private String orderPrice;
	private int stId;
	private int deliveryNo;
	private String orderStatus;
	private String orderCancel;
	
	
	public OrderMyPage() {
		
	}


	public OrderMyPage(long orederNo, int userNo, Date orderDate, String orderWay, String orderPrice, int stId,
			int deliveryNo, String orderStatus, String orderCancel) {
		super();
		this.orederNo = orederNo;
		UserNo = userNo;
		this.orderDate = orderDate;
		this.orderWay = orderWay;
		this.orderPrice = orderPrice;
		this.stId = stId;
		this.deliveryNo = deliveryNo;
		this.orderStatus = orderStatus;
		this.orderCancel = orderCancel;
	}


	public long getOrederNo() {
		return orederNo;
	}


	public void setOrederNo(long orederNo) {
		this.orederNo = orederNo;
	}


	public int getUserNo() {
		return UserNo;
	}


	public void setUserNo(int userNo) {
		UserNo = userNo;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getOrderWay() {
		return orderWay;
	}


	public void setOrderWay(String orderWay) {
		this.orderWay = orderWay;
	}


	public String getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}


	public int getStId() {
		return stId;
	}


	public void setStId(int stId) {
		this.stId = stId;
	}


	public int getDeliveryNo() {
		return deliveryNo;
	}


	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getOrderCancel() {
		return orderCancel;
	}


	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}


	@Override
	public String toString() {
		return "Order [orederNo=" + orederNo + ", UserNo=" + UserNo + ", orderDate=" + orderDate + ", orderWay="
				+ orderWay + ", orderPrice=" + orderPrice + ", stId=" + stId + ", deliveryNo=" + deliveryNo
				+ ", orderStatus=" + orderStatus + ", orderCancel=" + orderCancel + ", getOrederNo()=" + getOrederNo()
				+ ", getUserNo()=" + getUserNo() + ", getOrderDate()=" + getOrderDate() + ", getOrderWay()="
				+ getOrderWay() + ", getOrderPrice()=" + getOrderPrice() + ", getStId()=" + getStId()
				+ ", getDeliveryNo()=" + getDeliveryNo() + ", getOrderStatus()=" + getOrderStatus()
				+ ", getOrderCancel()=" + getOrderCancel() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}


	
	
	
	
	
	
	
	
	
	
}
















