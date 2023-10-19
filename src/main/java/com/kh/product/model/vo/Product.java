package com.kh.product.model.vo;

public class Product {

	
	private int productNo;
	private String productName;
	private String productPrice;
	private String productExplain;
	private String origin;
	private String productImg;
	private String productStatus;
	private int productAmount;
	
	
	public Product() {
		
	}
	
	
	
	
	
	public Product(int productNo, String productName, String productPrice, String productExplain, String origin,
			String productImg, String productStatus) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productExplain = productExplain;
		this.origin = origin;
		this.productImg = productImg;
		this.productStatus = productStatus;
	}
	
	
	
	public Product(int productNo, int productAmount) {
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductExplain() {
		return productExplain;
	}
	public void setProductExplain(String productExplain) {
		this.productExplain = productExplain;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	

	


	public int getProductAmount() {
		return productAmount;
	}





	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}





	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productExplain=" + productExplain + ", origin=" + origin + ", productImg=" + productImg
				+ ", productStatus=" + productStatus + ", productAmount=" + productAmount + "]";
	}
	
	
	

	
}
