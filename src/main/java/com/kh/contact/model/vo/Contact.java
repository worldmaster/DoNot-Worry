package com.kh.contact.model.vo;

import java.sql.Date;

public class Contact {
	private int contNo;
	private String contTitle;
	private String contCont;
	private String contWriter;
	private Date contDate;
	private String userReply;
	private String adminReply;
	private String contStatus;
	
	public Contact() {
		
	}
	
	public Contact(int contNo, String contTitle, String contCont, String contWriter, Date contDate, String userReply,
		String adminReply, String contStatus) {
		
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contCont = contCont;
		this.contWriter = contWriter;
		this.contDate = contDate;
		this.userReply = userReply;
		this.adminReply = adminReply;
		this.contStatus = contStatus;
	}

	//건의사항 메인페이지 조회
	public Contact(int contNo, String contTitle, String contWriter, Date contDate) {
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contWriter = contWriter;
		this.contDate = contDate;
	}
	
	//건의사항 상세페이지 조회
	

	public int getContNo() {
		return contNo;
	}

	public Contact(int contNo, String contTitle, String contCont, String contWriter, Date contDate, String userReply,
			String adminReply) {
		super();
		this.contNo = contNo;
		this.contTitle = contTitle;
		this.contCont = contCont;
		this.contWriter = contWriter;
		this.contDate = contDate;
		this.userReply = userReply;
		this.adminReply = adminReply;
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
	
	//건의사항 조회할떄 필요한 생성자
	
	
	
	
	
	
}
