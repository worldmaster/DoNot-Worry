package com.kh.AdminNotice.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.AdminNotice.model.dao.AdminNoticeDao;
import com.kh.AdminNotice.model.vo.AdminNotice;

public class AdminNoticeService {
	
	public ArrayList<AdminNotice> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<AdminNotice> list = new AdminNoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
	}
	
	public AdminNotice selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		AdminNotice an = new AdminNoticeDao().selectNotice(conn, noticeNo);
		
		System.out.println(an);
		
		close(conn);
		
		return an;
	}
	
	public int insertNotice(String title, String content) {
		
		Connection conn = getConnection();
		
		int result = new AdminNoticeDao().insertNotice(conn, title, content);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateNotice(int noticeNo, String title, String content) {
		
		Connection conn = getConnection();
		
		int result = new AdminNoticeDao().updateNotice(conn, noticeNo, title, content);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteNotice(int noticeNo) {

		Connection conn = getConnection();
		
		int result = new AdminNoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<AdminNotice> AdminListSearch(String searchKey) {

			Connection conn = getConnection();
			
			ArrayList<AdminNotice> searchList = new AdminNoticeDao().AdminListSearch(conn, searchKey);
			
			close(conn);
		return searchList;
	}

}
