package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
	//user_no는 필요가없음
	private int noticeNo;
	private String noticeTitle;
	private String noticeCont;
	private String noticeWriter;
	private Date noticeDate;
	private String noticeStatus;

	
	
	public Notice() {}

	
	


	public Notice(int noticeNo, String noticeTitle,String noticeWriter,Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
	}

	
	


	public Notice(int noticeNo, String noticeTitle, String noticeCont, String noticeWriter, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeCont = noticeCont;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
	}






	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public String getNoticeTitle() {
		return noticeTitle;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public String getNoticeCont() {
		return noticeCont;
	}



	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}



	public Date getNoticeDate() {
		return noticeDate;
	}



	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}



	public String getNoticeStatus() {
		return noticeStatus;
	}



	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}



	public String getNoticeWriter() {
		return noticeWriter;
	}



	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}



	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeCont=" + noticeCont
				+ ", noticeWriter=" + noticeWriter + ", noticeDate=" + noticeDate + ", noticeStatus=" + noticeStatus
				+ "]";
	}

	
	
	
}