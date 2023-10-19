package com.kh.AdminNotice.model.vo;

import java.sql.Date;

public class AdminNotice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeCont;
	private String noticeWriter;
	private Date noticeDate;
	private String noticeStatus;
	
	public AdminNotice() {
		
	}

	public AdminNotice(int noticeNo, String noticeTitle, String noticeCont, String noticeWriter, Date noticeDate,
			String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeCont = noticeCont;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeStatus = noticeStatus;
	}

	public AdminNotice(int noticeNo, String noticeTitle, String noticeWriter, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
	}

	public AdminNotice(int noticeNo, String noticeTitle, String noticeCont, String noticeWriter, Date noticeDate) {
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

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
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

	@Override
	public String toString() {
		return "AdminNotice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeCont=" + noticeCont
				+ ", noticeWriter=" + noticeWriter + ", noticeDate=" + noticeDate + ", noticeStatus=" + noticeStatus
				+ "]";
	}
	
	
	
}
