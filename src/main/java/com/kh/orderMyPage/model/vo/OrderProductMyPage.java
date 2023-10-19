package com.kh.orderMyPage.model.vo;

public class OrderProductMyPage {
	
	private String upLoadDir;
	private String productName;
	private int productQcy;
	private String productPrice;
	private int amountPayment;
	
	
	public OrderProductMyPage() {
		
	}


	public OrderProductMyPage(String upLoadDir, String productName, int productQcy, String productPrice, int amountPayment) {
		super();
		this.upLoadDir = upLoadDir;
		this.productName = productName;
		this.productQcy = productQcy;
		this.productPrice = productPrice;
		this.amountPayment = amountPayment;
	}


	public String getUpLoadDir() {
		return upLoadDir;
	}


	public void setUpLoadDir(String upLoadDir) {
		this.upLoadDir = upLoadDir;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductQcy() {
		return productQcy;
	}


	public void setProductQcy(int productQcy) {
		this.productQcy = productQcy;
	}


	public String getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}


	public int getAmountPayment() {
		return amountPayment;
	}


	public void setAmountPayment(int amountPayment) {
		this.amountPayment = amountPayment;
	}


	@Override
	public String toString() {
		return "OrderProduct [upLoadDir=" + upLoadDir + ", productName=" + productName + ", productQcy=" + productQcy
				+ ", productPrice=" + productPrice + ", amountPayment=" + amountPayment + "]";
	}


	
	
	
	
	
}