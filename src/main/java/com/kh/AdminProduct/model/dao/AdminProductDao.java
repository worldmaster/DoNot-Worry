package com.kh.AdminProduct.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.AdminProduct.model.vo.AdminNutrition;
import com.kh.AdminProduct.model.vo.AdminProduct;
import com.kh.AdminProduct.model.vo.Attachment;
import com.kh.notice.model.vo.Notice;


public class AdminProductDao {
	
	private Properties prop = new Properties();
	
	public AdminProductDao() {
		try {
			prop.loadFromXML(new FileInputStream( AdminProductDao.class.getResource("/sql/product/product-mapper.xml").getPath()  ));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	public int insertProductAttachment(Connection conn, Attachment at) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	public int insertProduct(Connection conn, AdminProduct ap) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		

		
		try {
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setString(1,ap.getProductName());
			pstmt.setString(2,ap.getProductPrice());
			pstmt.setString(3,ap.getProductExplain());
			pstmt.setString(4,ap.getOrigin());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNutrition(Connection conn, AdminNutrition an) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNutrition");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,an.getKcal());
			pstmt.setInt(2,an.getServingSize());
			pstmt.setInt(3,an.getSugar());
			pstmt.setInt(4,an.getProtein());
			pstmt.setInt(5,an.getFat());
			pstmt.setInt(6,an.getNa());
			pstmt.setString(7,an.getAllergy());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}



	public ArrayList<AdminProduct> selectProductList(Connection conn) {

		ArrayList<AdminProduct> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				AdminProduct n = new AdminProduct(rset.getInt("PRODUCT_NO"),
									  rset.getString("PRODUCT_NAME"),
									  rset.getString("PRODUCT_PRICE"),
									  rset.getString("PRODUCT_EXPLAIN"),
									  rset.getString("ORIGIN"),
									  rset.getString("FILE_PATH"),
									  rset.getString("PRODUCT_STATUS"));
				list.add(n);
			}
//			System.out.println(list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public AdminProduct selectProductDetailList(Connection conn, int productNo) {
		
		AdminProduct ap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductDetailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ap = new AdminProduct(
						rset.getInt("PRODUCT_NO"),
						rset.getString("PRODUCT_NAME"),
						rset.getString("PRODUCT_PRICE"),
						rset.getString("PRODUCT_EXPLAIN"),
						rset.getString("ORIGIN"),
						rset.getString("FILE_PATH")
				);
						
						
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ap;
		
		
	}



	public int deleteProduct(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("deleteProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}



}
