package com.kh.AdminNotice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.AdminNotice.model.vo.AdminNotice;

public class AdminNoticeDao {
	
	private Properties prop = new Properties();
	
	public AdminNoticeDao() {
		
		String fileName = AdminNoticeDao.class.getResource("/sql/adminNotice/adminNotice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<AdminNotice> selectNoticeList(Connection conn){
		
		ArrayList<AdminNotice> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				AdminNotice an = new AdminNotice(
						rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("USER_ID"),
						rset.getDate("NOTICE_DATE")
						);
				
				list.add(an);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public AdminNotice selectNotice(Connection conn, int noticeNo) {
		
		AdminNotice an = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				an = new AdminNotice(
						rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONT"),
						rset.getString("USER_ID"),
						rset.getDate("NOTICE_DATE")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return an;
	}
	
	public int insertNotice(Connection conn, String title, String content) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
			
	}

	public int updateNotice(Connection conn, int noticeNo, String title, String content) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, int noticeNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<AdminNotice> AdminListSearch(Connection conn, String searchKey) {

		ArrayList<AdminNotice> searchList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("AdminListSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchKey);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				AdminNotice search = new AdminNotice();
						search.setNoticeNo(rset.getInt("NOTICE_NO"));
						search.setNoticeTitle(rset.getString("NOTICE_TITLE"));
						search.setNoticeWriter(rset.getString("USER_ID"));
						search.setNoticeDate(rset.getDate("NOTICE_DATE"));
						
				
				searchList.add(search);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return searchList;
	}
	

	
	

}
