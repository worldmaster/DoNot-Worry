package com.kh.AdminContact.model.vo;

import java.sql.Date;

public class AdminContact {
	
	private int contNo;
	private String contTitle;
	private String contCont;
	private String contWriter;
	private Date contDate;
	private String userReply;
	private String adminReply;
	private String contStatus;
		
	public AdminContact() {
		
	}

	public AdminContact(int contNo, String contTitle, String contWriter, Date contDate) {
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contWriter = contWriter;
		this.contDate = contDate;
	}
	

	public AdminContact(int contNo, String contTitle, String contCont, String contWriter, Date contDate) {
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contCont = contCont;
		this.contWriter = contWriter;
		this.contDate = contDate;
	}

	public AdminContact(int contNo, String contTitle, String contCont, String contWriter, Date contDate,
			String userReply, String adminReply) {
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contCont = contCont;
		this.contWriter = contWriter;
		this.contDate = contDate;
		this.userReply = userReply;
		this.adminReply = adminReply;
	}
	

	public AdminContact(int contNo, String contTitle, String contCont, String contWriter, Date contDate,
			String userReply) {
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contCont = contCont;
		this.contWriter = contWriter;
		this.contDate = contDate;
		this.userReply = userReply;
	}

//	public AdminContact(int contNo, String contTitle, String contCont, String contWriter, Date contDate,
//			String adminReply) {
//		super();
//		this.contNo = contNo;
//		this.contTitle = contTitle;
//		this.contCont = contCont;
//		this.contWriter = contWriter;
//		this.contDate = contDate;
//		this.adminReply = adminReply;
//	}

	public int getContNo() {
		return contNo;
	}

	public void setContNo(int contNo) {
		this.contNo = contNo;
	}

	public String getContTitle() {
		return contTitle;
	}

	public void setContTitle(String contTitle) {
		this.contTitle = contTitle;
	}

	public String getContCont() {
		return contCont;
	}

	public void setContCont(String contCont) {
		this.contCont = contCont;
	}

	public String getContWriter() {
		return contWriter;
	}

	public void setContWriter(String contWriter) {
		this.contWriter = contWriter;
	}

	public Date getContDate() {
		return contDate;
	}

	public void setContDate(Date contDate) {
		this.contDate = contDate;
	}

	public String getUserReply() {
		return userReply;
	}

	public void setUserReply(String userReply) {
		this.userReply = userReply;
	}

	public String getAdminReply() {
		return adminReply;
	}

	public void setAdminReply(String adminReply) {
		this.adminReply = adminReply;
	}

	public String getContStatus() {
		return contStatus;
	}

	public void setContStatus(String contStatus) {
		this.contStatus = contStatus;
	}

	@Override
	public String toString() {
		return "AdminContact [contNo=" + contNo + ", contTitle=" + contTitle + ", contCont=" + contCont
				+ ", contWriter=" + contWriter + ", contDate=" + contDate + ", userReply=" + userReply + ", adminReply="
				+ adminReply + ", contStatus=" + contStatus + "]";
	}
	
	

}
