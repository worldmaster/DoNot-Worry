package com.kh.order.model.vo;

import java.sql.Date;

public class Delivery {
	
	private int delNo;
	private String recName;
	private String recPhone;
	private String recAddress;
	private String msg;
	private String delDate;
	
	public Delivery() {
		
	}
	
	
	public Delivery(int delNo, String recName, String recPhone, String recAddress, String msg, String delDate) {
		super();
		this.delNo = delNo;
		this.recName = recName;
		this.recPhone = recPhone;
		this.recAddress = recAddress;
		this.msg = msg;
		this.delDate = delDate;
	}


	public int getDelNo() {
		return delNo;
	}


	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}


	public String getRecName() {
		return recName;
	}


	public void setRecName(String recName) {
		this.recName = recName;
	}


	public String getRecPhone() {
		return recPhone;
	}


	public void setRecPhone(String recPhone) {
		this.recPhone = recPhone;
	}


	public String getRecAddress() {
		return recAddress;
	}


	public void setRecAddress(String recAddress) {
		this.recAddress = recAddress;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public String getDelDate() {
		return delDate;
	}


	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}


	@Override
	public String toString() {
		return "Delivery [delNo=" + delNo + ", recName=" + recName + ", recPhone=" + recPhone + ", recAddress="
				+ recAddress + ", msg=" + msg + ", delDate=" + delDate + "]";
	}
	
	
	
	
}
