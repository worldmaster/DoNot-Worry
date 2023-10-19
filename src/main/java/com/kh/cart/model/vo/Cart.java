package com.kh.cart.model.vo;

public class Cart {
	
	private int cartNo;
	private String productName;
	private int userNo;
	private String cartStatus;
	private int productQty;
	
	public Cart() {
		
	}
	
	public Cart(int cartNo, String productName, int userNo, String cartStatus, int productQty) {
		super();
		this.cartNo = cartNo;
		this.productName = productName;
		this.userNo = userNo;
		this.cartStatus = cartStatus;
		this.productQty = productQty;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCartStatus() {
		return cartStatus;
	}

	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}

	public int getProductQty() {
		return productQty;
	}

	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", productName=" + productName + ", userNo=" + userNo + ", cartStatus="
				+ cartStatus + ", productQty=" + productQty + "]";
	}
	
	

}
