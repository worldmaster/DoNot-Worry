package com.kh.contact.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.common.model.vo.PageInfo1;
import com.kh.contact.model.vo.Contact;



public class ContactDao {
	
	private Properties prop = new Properties();
	
	public ContactDao() {
		try {
			prop.loadFromXML(new FileInputStream( ContactDao.class.getResource("/sql/board/board-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		
		// SELECT문 => ResultSet객체 (한행)
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Contact> selectList(Connection conn, PageInfo1 pi) {
		
		ArrayList<Contact> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/* 
			 * rownum의 시작값과 종료값 공식
			 * boardLimit이 10이라고 가정
			 * currentPage = 1 => 시작값 1, 종료값 10
			 * currentPage = 2 => 시작값 11, 종료값 20
			 * currentPage = 3 => 시작값 21, 종료값 30
			 * 
			 * 시작값 = (currentPage - 1) * boardLimit +1
			 * 종료값 = 시작값 + boardLimit -1
			 * */
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow   = startRow + pi.getBoardLimit() - 1; 
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Contact(
									rset.getInt("CONT_NO"),
									rset.getString("CONT_TITLE"), 
									rset.getString("USER_ID"),
									rset.getDate("CONT_DATE")						
						));
			}
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Contact selectContact(Connection conn, int boardNo) {
		
		Contact b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Contact(  
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public int updateContact(Connection conn, Contact b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getContTitle());
			pstmt.setString(2, b.getContCont());
			pstmt.setString(3, b.getUserReply());
			pstmt.setInt(4, b.getContNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteContact(Connection conn, int contNo) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, contNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}

	public int insertContact(Connection conn, Contact b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getContTitle());
			pstmt.setString(2, b.getContCont());
			pstmt.setInt(3,Integer.parseInt(b.getContWriter()));
			pstmt.setString(4, b.getUserReply());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
		
		
		
	}
		
		
	
	
	
		
	}


