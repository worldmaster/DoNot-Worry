package com.kh.order.model.vo;

public class OrderProduct {

	private int productNo;
	private int productAmount;
	
	public OrderProduct() {
		
	}

	public OrderProduct(int productNo, int productAmount) {
		super();
		this.productNo = productNo;
		this.productAmount = productAmount;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	@Override
	public String toString() {
		return "OrderProduct [productNo=" + productNo + ", productAmount=" + productAmount + "]";
	}
	
	
	
}
