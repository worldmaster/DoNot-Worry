package com.kh.orderMyPage.model.vo;

import java.sql.Date;

public class OrderListMyPage {
	private Date orderDate;
	private String stName;
	private String productName;
	private long orderNo;
	private String deliveryStatus;
	private String orderCancel;
	private String userId;
	
	public OrderListMyPage() {
		
	}

	public OrderListMyPage(Date orderDate, String stName, String productName, long orderNo, String deliveryStatus,
			String orderCancel, String userId) {
		super();
		this.orderDate = orderDate;
		this.stName = stName;
		this.productName = productName;
		this.orderNo = orderNo;
		this.deliveryStatus = deliveryStatus;
		this.orderCancel = orderCancel;
		this.userId = userId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getStName() {
		return stName;
	}

	public void setStName(String stName) {
		this.stName = stName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getOrderCancel() {
		return orderCancel;
	}

	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "OrderList [orderDate=" + orderDate + ", stName=" + stName + ", productName=" + productName
				+ ", orderNo=" + orderNo + ", deliveryStatus=" + deliveryStatus + ", orderCancel=" + orderCancel
				+ ", userId=" + userId + "]";
	}


	


	
	
	
	
	
}
