package com.kh.AdminContact.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.AdminContact.model.dao.AdminContactDao;
import com.kh.AdminContact.model.vo.AdminContact;
import com.kh.common.model.vo.pageBar;

public class AdminContactDao {
	
private Properties prop = new Properties();
	
	public AdminContactDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdminContactDao.class.getResource("/sql/adminContact/adminContact-mapper.xml").getPath()));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {

		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<AdminContact> selectList(Connection conn, pageBar pb) {
		
		ArrayList<AdminContact> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pb.getCurrentPage() - 1) * pb.getContactLimit() + 1;
			int endRow = startRow + pb.getContactLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdminContact(
						rset.getInt("CONT_NO"),
						rset.getString("CONT_TITLE"),
						rset.getString("USER_ID"),
						rset.getDate("CONT_DATE")
						));
				
				System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public AdminContact selectContact(Connection conn, int contNo) {

		AdminContact ac = null;
			
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
			
		String sql = prop.getProperty("selectContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, contNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ac = new AdminContact(
						rset.getInt("CONT_NO"),
						rset.getString("CONT_TITLE"),
						rset.getString("CONT_CONT"),
						rset.getString("USER_ID"),
						rset.getDate("CONT_DATE"),
						rset.getString("USER_REPLY"),
						rset.getString("ADMIN_REPLY")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ac;
	}

	public int deleteCont(Connection conn, int contNo) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCont");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int adreply(Connection conn, int contNo, String adminReply) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adreply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminReply);
			pstmt.setInt(2, contNo);
			
			result = pstmt.executeUpdate();
			
			System.out.println("dao reply값 : "+ adminReply);
			System.out.println("dao contNo값 : "+ contNo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	

}
