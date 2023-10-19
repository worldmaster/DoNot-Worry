package com.kh.order.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import com.kh.order.model.vo.Delivery;
import com.kh.order.model.vo.Order;
import com.kh.order.model.vo.OrderProduct;

public class OrderDao {
	
	
	private Properties prop = new Properties();

	public OrderDao() {

		String fileName = OrderDao.class.getResource("/sql/order/order-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {

		}
	}

	public int orderInput(Connection conn, ArrayList<OrderProduct> orderProduct, int storeIdOrder, Order orderInfo,
			Delivery del, int userNo) {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result = 0;
		
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		String sql1 = prop.getProperty("delInput");
		String sql2 = prop.getProperty("orderInput");
		String sql3 = prop.getProperty("orderProductInput");
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt2 = conn.prepareStatement(sql2);
			pstmt3 = conn.prepareStatement(sql3);
			
			pstmt1.setString(1, del.getRecName());
			pstmt1.setString(2, del.getRecPhone());
			pstmt1.setString(3, del.getRecAddress());
			pstmt1.setString(4, del.getMsg());
			pstmt1.setString(5, del.getDelDate());
			result1 = pstmt1.executeUpdate();
			
			pstmt2.setLong(1, orderInfo.getOrderNo());
			pstmt2.setInt(2, userNo);
			pstmt2.setString(3, orderInfo.getOrderWay());
			pstmt2.setString(4, orderInfo.getOrderPrice());
			pstmt2.setInt(5, storeIdOrder);
			result2 = pstmt2.executeUpdate();
			
			Iterator it = orderProduct.iterator();
			while(it.hasNext()) {
				OrderProduct p = (OrderProduct)it.next();
				pstmt3.setLong(1, orderInfo.getOrderNo());
				pstmt3.setInt(2, userNo);
				pstmt3.setInt(3, p.getProductNo());
				pstmt3.setInt(4, p.getProductAmount());
				
				result3 = pstmt3.executeUpdate();
				
				if(result3 == 0) {
					System.out.println("result3의 값이 0이다." + p);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt3);
			close(pstmt2);
			close(pstmt1);
		}
		
		
		
		result = result1*result2*result3;
		
		
		return result;
	}

}
