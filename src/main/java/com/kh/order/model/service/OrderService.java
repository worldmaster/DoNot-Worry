package com.kh.order.model.service;

import static com.kh.common.JDBCTemplate.commit;

import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Delivery;
import com.kh.order.model.vo.Order;
import com.kh.order.model.vo.OrderProduct;

public class OrderService {

	public int orderInput(ArrayList<OrderProduct> orderProduct, int storeIdOrder, Order orderInfo, Delivery del,
			int userNo) {
		
		
		Connection conn = getConnection();
		
		int result = new OrderDao().orderInput(conn, orderProduct, storeIdOrder, orderInfo, del, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}
