package com.kh.order.model.dao;

import java.io.FileInputStream;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.order.model.vo.Store;
import static com.kh.common.JDBCTemplate.*;

public class StoreDao {

	private Properties prop = new Properties();

	public StoreDao() {

		String fileName = StoreDao.class.getResource("/sql/order/order-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {

		}
	}

	public ArrayList<Store> storeList(Connection conn) {

		ArrayList<Store> sList = new ArrayList();

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql = prop.getProperty("storeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Store s = new Store();
				
				s.setStoreId(rs.getInt("ST_ID"));
				s.setStoreName(rs.getString("ST_NAME"));
				s.setStoreAddress(rs.getString("ST_ADDRESS"));
				s.setLatitude(rs.getString("LATITUDE"));
				s.setLongitude(rs.getString("LONGITUDE"));
				
				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return sList;
	}

}
