package com.kh.contact.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import com.kh.common.model.vo.PageInfo1;
import com.kh.contact.model.dao.ContactDao;
import com.kh.contact.model.vo.Contact;


public class ContactService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ContactDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Contact> selectList(PageInfo1 pi) {
		Connection conn = getConnection();
		
		ArrayList<Contact> list = new ContactDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
		
		
	}


	public Contact selectContact(int boardNo) {
		Connection conn = getConnection();
		
		Contact b = new ContactDao().selectContact(conn, boardNo);
		
		close(conn);
		
		return b;
	}

	public int updateContact(Contact b) {
		Connection conn = getConnection();
		
		int result = new ContactDao().updateContact(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int deleteContact(int contNo) {
	Connection conn = getConnection();
		
		int result = new ContactDao().deleteContact(conn, contNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertContact(Contact b) {
		Connection conn = getConnection();
		
		int result = new ContactDao().insertContact(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
	}

}
