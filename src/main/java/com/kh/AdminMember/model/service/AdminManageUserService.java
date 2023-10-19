package com.kh.AdminMember.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.AdminMember.model.dao.AdminManageUserDao;
import com.kh.AdminMember.model.vo.AdminManageUser;
import static com.kh.common.JDBCTemplate.*;

public class AdminManageUserService {

	public ArrayList<AdminManageUser> selectManageList() {

		Connection conn = getConnection();
		
		ArrayList<AdminManageUser> list = new AdminManageUserDao().selectManageList(conn);
		
		close(conn);
		
		return list;
	}

	public AdminManageUser updateUserDetail(int userNo) {
		
		Connection conn = getConnection();
		
		AdminManageUser aaa = new AdminManageUserDao().updateUserDetail(conn, userNo);
		
		close(conn);
		return aaa;
	}

	public int updateUser(AdminManageUser am) {
		
		Connection conn = getConnection();
		
		int result = new AdminManageUserDao().updateUser(conn, am);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteUser(int userNo, String status) {

		Connection conn = getConnection();
		
		int result = new AdminManageUserDao().deleteUser(conn, userNo, status);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

}
