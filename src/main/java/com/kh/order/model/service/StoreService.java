package com.kh.order.model.service;

import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.order.model.dao.StoreDao;
import com.kh.order.model.vo.Store;

public class StoreService {

	public ArrayList<Store> storeList() {
		Connection conn = getConnection();
		
		ArrayList<Store> sList = new StoreDao().storeList(conn);
		
		if(sList != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return sList;
	}

	
	
}
