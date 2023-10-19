package com.kh.AdminProduct.model.vo;

public class AdminProduct {
	private int productNo;
	private String productName;
	private String productPrice;
	private String productExplain;
	private String origin;
	private String fileNo; //건의사항에서는 cont_writer int형임 근데 거기서도 String으로 해줬음 DAo에서 set할때는 int로 해줘야됨
	private String productStatus;
	
	
	public AdminProduct() {
		
	}
	
	
	
	public AdminProduct(int productNo, String productName, String productPrice, String productExplain, String origin,
			String fileNo, String productStatus) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productExplain = productExplain;
		this.origin = origin;
		this.fileNo = fileNo;
		this.productStatus = productStatus;
	}



	
	
	
	
	
	
	



	public AdminProduct(int productNo, String productName, String productPrice, String productExplain, String origin,
			String fileNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productExplain = productExplain;
		this.origin = origin;
		this.fileNo = fileNo;
	}

	//상품리스트조회
	public AdminProduct(int productNo, String productName, String productPrice, String productExplain, String fileNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productExplain = productExplain;
		this.fileNo = fileNo;
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




	public String getFileNo() {
		return fileNo;
	}




	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}




	public String getProductStatus() {
		return productStatus;
	}




	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}




	@Override
	public String toString() {
		return "AdminProduct [productNo=" + productNo + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productExplain=" + productExplain + ", origin=" + origin + ", fileNo=" + fileNo
				+ ", productStatus=" + productStatus + "]";
	}
	
	
	//상품상세조회(나중에)
	

	
	

	

}
