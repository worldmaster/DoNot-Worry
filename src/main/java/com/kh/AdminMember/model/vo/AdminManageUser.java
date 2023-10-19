package com.kh.AdminMember.model.vo;

public class AdminManageUser {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String bDay;
	private String phone;
	private String address;
	private String status;

	public AdminManageUser() {
		
	}

	public AdminManageUser(int userNo, String userId, String userPwd, String userName, String bDay, String phone,
			String address, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
		this.status = status;
	}
	
	//회원 관리 테이블
	public AdminManageUser(int userNo, String userId, String userName, String bDay, String phone, String address,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
		this.status = status;
	}
	
	public AdminManageUser(int userNo, String userId, String userName, String bDay, String phone, String address) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
	}
	

	public AdminManageUser(String userId, String userName, String bDay, String phone, String address) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
	}

	public AdminManageUser(int userNo, String userName, String bDay, String phone, String address) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
	}

	// 회원 정보 수정
	public AdminManageUser(String userName, String bDay, String phone, String address) {
		super();
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
	}
	
	

	public AdminManageUser(String userId, String userName, String bDay, String phone, String address, String status) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.bDay = bDay;
		this.phone = phone;
		this.address = address;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getbDay() {
		return bDay;
	}

	public void setbDay(String bDay) {
		this.bDay = bDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdminManageUser [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName="
				+ userName + ", address=" + address + ", bDay=" + bDay + ", phone=" + phone + ", status=" + status
				+ "]";
	}
	
	
	
}
