package com.kh.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.order.model.vo.Delivery;
import com.kh.order.model.vo.Order;
import com.kh.order.model.vo.OrderProduct;

public class PayDao {
	
	private Properties prop = new Properties();

	public PayDao() {

		String fileName = OrderDao.class.getResource("/sql/order/order-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {

		}
	}
	

	public Order payOrderList(Connection conn, int userNo) {
		Order o = new Order();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("payOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				o.setOrderNo(rs.getLong("ORDER_NO"));
				o.setDeliveryNo(rs.getInt("DELIVERY_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(o);
		
		return o;
	}

	public Delivery payDeliveryList(Connection conn, Order o) {
		Delivery d = new Delivery();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("payDeliveryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getDeliveryNo());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				d.setDelDate(rs.getString("DELIVERY_DATE"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return d;
	}


	public ArrayList<OrderProduct> payOpList(Connection conn, Order o) {
		ArrayList<OrderProduct> op = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("payOpList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, o.getOrderNo());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderProduct opp = new OrderProduct();
				opp.setProductNo(rs.getInt("PRODUCT_NO"));
				
				op.add(opp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return op;
	}

}
