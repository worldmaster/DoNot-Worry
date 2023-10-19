package com.kh.AdminProduct.model.vo;

public class AdminNutrition {
	private int productNo;// fk 상품번호 시퀀스로 넣을거임
	private int kcal;
	private int servingSize;
	private int sugar;
	private int protein;
	private int fat;
	private int na;
	private String allergy;
	
	public AdminNutrition() {
		
	}

	public AdminNutrition(int productNo, int kcal, int servingSize, int sugar, int protein, int fat, int na,
			String allergy) {
		super();
		this.productNo = productNo;
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

	public void setSugar(int sugars) {
		this.sugar = sugars;
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
		return "AdminNutrition [productNo=" + productNo + ", kcal=" + kcal + ", servingSize=" + servingSize
				+ ", sugar=" + sugar + ", protein=" + protein + ", fat=" + fat + ", na=" + na + ", allergy=" + allergy
				+ "]";
	}
	
	
	
	
}
