package com.kh.AdminMember.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.AdminMember.model.vo.AdminManageUser;

public class AdminManageUserDao {
	
	private Properties prop = new Properties();
	
	public AdminManageUserDao() {
		
		String fileName = AdminManageUserDao.class.getResource("/sql/adminMember/adminMember-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AdminManageUser> selectManageList(Connection conn) {
		
		ArrayList<AdminManageUser> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectManageList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				AdminManageUser amu = new AdminManageUser(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("B_DAY"),
						rset.getString("PHONE"),
						rset.getString("ADDRESS"),
						rset.getString("STATUS")
						);
				
				list.add(amu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public AdminManageUser updateUserDetail(Connection conn, int userNo) {
		
		AdminManageUser aaa = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateUserDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				aaa = new AdminManageUser(
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("B_DAY"),
						rset.getString("PHONE"),
						rset.getString("ADDRESS"),
						rset.getString("STATUS")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return aaa;
	}

	public int updateUser(Connection conn, AdminManageUser am) {
		
		 int result = 0;
		 PreparedStatement pstmt = null;
		 
		 String sql = prop.getProperty("updateUser");
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, am.getUserName());
			pstmt.setString(2, am.getbDay());
			pstmt.setString(3, am.getPhone());
			pstmt.setString(4, am.getAddress());
			pstmt.setInt(5, am.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

//	public int selectUser(Connection conn, int userNo) {
//		
//		AdminManageUser am = null;
//		
//		PreparedStatement pstmt = null;
//		
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectUser");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, userNo);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				 am = new AdminManageUser(
//						 	rset.getInt("USER_NO"),
//							rset.getString("USER_ID"),
//							rset.getString("USER_NAME"),
//							rset.getString("B_DAY"),
//							rset.getString("PHONE"),
//							rset.getString("ADDRESS"),
//							rset.getString("STATUS")
//						 );
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		return am;
//	}

	public int deleteUser(Connection conn, int userNo, String status) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
