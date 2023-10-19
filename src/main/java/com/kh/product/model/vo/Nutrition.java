package com.kh.product.model.vo;

public class Nutrition {
	
	private int productNo;
	private String productName;
	private int kcal;
	private int servingSize;
	private int sugar;
	private int protein;
	private int fat;
	private int na;
	private String allergy;
	
	
	public Nutrition() {
		
	}
	

	public Nutrition(int productNo, String productName, int kcal, int servingSize, int sugar, int protein, int fat, int na,
			String allergy) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.kcal = kcal;
		this.servingSize = servingSize;
		this.sugar = sugar;
		this.protein = protein;
		this.fat = fat;
		this.na = na;
		this.allergy = allergy;
	}



	public Nutrition(String productName, int kcal, int servingSize, int sugar, int protein, int fat, int na,
			String allergy) {
		super();
		this.productName = productName;
		this.kcal = kcal;
		this.servingSize = servingSize;
		this.sugar = sugar;
		this.protein = protein;
		this.fat = fat;
		this.na = na;
		this.allergy = allergy;
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



	public int getKcal() {
		return kcal;
	}



	public void setKcal(int kcal) {
		this.kcal = kcal;
	}



	public int getServingSize() {
		return servingSize;
	}



	public void setServingSize(int servingSize) {
		this.servingSize = servingSize;
	}



	public int getSugar() {
		return sugar;
	}



	public void setSugar(int sugar) {
		this.sugar = sugar;
	}



	public int getProtein() {
		return protein;
	}



	public void setProtein(int protein) {
		this.protein = protein;
	}



	public int getFat() {
		return fat;
	}



	public void setFat(int fat) {
		this.fat = fat;
	}



	public int getNa() {
		return na;
	}



	public void setNa(int na) {
		this.na = na;
	}



	public String getAllergy() {
		return allergy;
	}



	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}



	@Override
	public String toString() {
		return "Nutrition [productNo=" + productNo + ", productName=" + productName + ", kcal=" + kcal
				+ ", servingSize=" + servingSize + ", sugar=" + sugar + ", protein=" + protein + ", fat=" + fat
				+ ", na=" + na + ", allergy=" + allergy + "]";
	}




	
	
	
	
	
	
	
	
}
