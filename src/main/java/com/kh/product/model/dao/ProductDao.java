package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.product.model.vo.Product;
import static com.kh.common.JDBCTemplate.*;



public class ProductDao {
	
	private Properties prop = new Properties();

	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/sql/products/product-mapper.xml").getPath()));
			
			
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> productList(Connection conn) {
		
		ArrayList<Product> productList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productList");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(rs.getString("PRODUCT_NAME"));
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
				
				productList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return productList;
	}

	public ArrayList<Product> productList(String searchKey, Connection conn) {

		ArrayList<Product> productList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productListSearch");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, '%'+searchKey+'%');
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(rs.getString("PRODUCT_NAME"));
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
				
				productList.add(p);	
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return productList;
	}
	
	
	public ArrayList<Product> productListNewOrder(Connection conn) {
		ArrayList<Product> productList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productListNewOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(rs.getString("PRODUCT_NAME"));
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
				
				productList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}
	

	public ArrayList<Product> productListNameOrder(Connection conn) {
		
		ArrayList<Product> productList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productListNameOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(rs.getString("PRODUCT_NAME"));
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
				
				productList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}

	public ArrayList<Product> productListLowOrder(Connection conn) {

		ArrayList<Product> productList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productListLowOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(rs.getString("PRODUCT_NAME"));
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
				
				productList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}

	public ArrayList<Product> productListHighOrder(Connection conn) {
		ArrayList<Product> productList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productListHighOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(rs.getString("PRODUCT_NAME"));
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
				
				productList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}

	public Product productDetail(Connection conn, String productName) {
		
		Product p = new Product();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("productDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				p.setProductNo(rs.getInt("PRODUCT_NO"));
				p.setProductName(productName);
				p.setProductPrice(rs.getString("PRODUCT_PRICE"));
				p.setProductExplain(rs.getString("PRODUCT_EXPLAIN"));
				p.setOrigin(rs.getString("ORIGIN"));
				p.setProductImg(rs.getString("PRODUCT_IMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return p;
	}

	

	

}
