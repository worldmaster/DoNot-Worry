package com.kh.member.model.vo;



public class Member {  
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String newPwd;
	private String userName;
	private String address;
	private String bDay;
	private String phone;
	private String status;
	
	public Member() {
		
	}
	
	// 로그인시
	public Member(int userNo, String userId, String userPwd, String userName, String address, String bDay, String phone,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.address = address;
		this.bDay = bDay;
		this.phone = phone;
		this.status = status;
	}
	
	// 회원가입 & 내정보수정
	public Member(String userId, String userPwd, String userName, String address, String bDay, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.address = address;
		this.bDay = bDay;
		this.phone = phone;
	}


	public Member(String userId, String userPwd, String newPwd, String userName, String address, String bDay,
			String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.newPwd = newPwd;
		this.userName = userName;
		this.address = address;
		this.bDay = bDay;
		this.phone = phone;
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

	
	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
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
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", newPwd=" + newPwd
				+ ", userName=" + userName + ", address=" + address + ", bDay=" + bDay + ", phone=" + phone
				+ ", status=" + status + "]";
	}


	
	
	
	
	
	
}
