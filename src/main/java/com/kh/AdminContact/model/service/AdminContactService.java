package com.kh.AdminContact.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.AdminContact.model.dao.AdminContactDao;
import com.kh.AdminContact.model.vo.AdminContact;
import com.kh.common.model.vo.pageBar;

import static com.kh.common.JDBCTemplate.*;

public class AdminContactService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdminContactDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}

	public ArrayList<AdminContact> selectList(pageBar pb) {
		
		Connection conn = getConnection();
		
		ArrayList<AdminContact> list = new AdminContactDao().selectList(conn, pb);
		
		close(conn);
		return list;
	}

	public AdminContact selectContact(int contNo) {
		
		Connection conn = getConnection();
		
		AdminContact ac = new AdminContactDao().selectContact(conn, contNo);
		
		close(conn);
		
		return ac;
	}

	public int deleteCont(int contNo) {

		Connection conn = getConnection();
		
		int result = new AdminContactDao().deleteCont(conn, contNo);
		
		if(result > 0) {
			commit(conn);
		}else {
		rollback(conn);
		}
		close(conn);
		return result;
	}

	public int adreply(int contNo, String adminReply) {

		Connection conn = getConnection();
		
		int result = new AdminContactDao().adreply(conn, contNo, adminReply);
		
		if(result > 0) {
			commit(conn);
		}else {
		rollback(conn);
		}
		close(conn);
		return result;
	}

}
