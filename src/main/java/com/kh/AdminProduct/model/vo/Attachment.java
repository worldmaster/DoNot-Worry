package com.kh.AdminProduct.model.vo;

import java.sql.Date;

public class Attachment {
	private int fileNo;
	private String originName;
	private Date uploadDate;
	private String changeName;
	private String filePath;
	
	public Attachment() {
		
	}
	
	
	public Attachment(int fileNo, String originName, Date uploadDate, String changeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.uploadDate = uploadDate;
		this.changeName = changeName;
		this.filePath = filePath;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", originName=" + originName + ", uploadDate=" + uploadDate
				+ ", changeName=" + changeName + ", filePath=" + filePath + "]";
	}
	
	
}
