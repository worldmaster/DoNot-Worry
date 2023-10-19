package com.kh.order.model.service;

import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.order.model.dao.PayDao;
import com.kh.order.model.vo.Delivery;
import com.kh.order.model.vo.Order;
import com.kh.order.model.vo.OrderProduct;

public class PayService {

	public Order payOrderList(int userNo) {
		Connection conn = getConnection();
		
		Order o = new PayDao().payOrderList(conn, userNo);
		
		if(o == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		return o;
	}

	public Delivery payDeliveryList(Order o) {
		Connection conn = getConnection();
		
		Delivery d = new PayDao().payDeliveryList(conn, o);
		
		if(d == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		return d;
	}

	public ArrayList<OrderProduct> payOpList(Order o) {
		Connection conn = getConnection();
		
		ArrayList<OrderProduct> op = new PayDao().payOpList(conn, o);
		
		if(op == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		return op;
	}

}
