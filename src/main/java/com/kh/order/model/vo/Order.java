package com.kh.order.model.vo;

import java.sql.Date;

public class Order {

	
	private Long orderNo;
	private String orderWay;
	private String orderPrice;
	private int deliveryNo;
	
	public Order() {
		
	}

	public Order(Long orderNo, String orderWay, String orderPrice, int deliveryNo) {
		super();
		this.orderNo = orderNo;
		this.orderWay = orderWay;
		this.orderPrice = orderPrice;
		this.deliveryNo = deliveryNo;
	}

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
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


	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderWay=" + orderWay + ", orderPrice=" + orderPrice + ", deliveryNo=" + deliveryNo + "]";
	}
	
	
	
	
	
}
