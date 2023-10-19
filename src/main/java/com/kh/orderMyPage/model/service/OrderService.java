package com.kh.orderMyPage.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo1;
import com.kh.member.model.vo.Member;
import com.kh.orderMyPage.model.dao.OrderDao;
import com.kh.orderMyPage.model.vo.Delivery;
import com.kh.orderMyPage.model.vo.OrderMyPage;
import com.kh.orderMyPage.model.vo.OrderListMyPage;
import com.kh.orderMyPage.model.vo.OrderProductMyPage;
import com.kh.orderMyPage.model.vo.StoreMyPage;

public class OrderService {
	
	
	public int selectListCount(int userNo) {
		
		Connection conn = getConnection();
		
		int listCount = new OrderDao().selectListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<OrderListMyPage> selectListMyPage(PageInfo1 pi, int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<OrderListMyPage> list = new OrderDao().selectListMyPage(conn, pi, userNo);
		
		close(conn);
		
		return list;
	}
	
	
	
	public ArrayList<OrderProductMyPage> selectOPList(long orderNo){
		
		Connection conn = getConnection();
		
		ArrayList<OrderProductMyPage> list = new OrderDao().selectOPList(conn, orderNo);
		
		close(conn);
		
		return list;
	}
	
	public OrderMyPage selectOrder(long orderNo) {
		Connection conn = getConnection();
		
		OrderMyPage o = new OrderDao().selectOrder(conn, orderNo);
		
		close(conn);
		
		return o;
	}
	
	public StoreMyPage selectStore(long orderNo) {
		Connection conn = getConnection();
		
		StoreMyPage st = new OrderDao().selectStore(conn, orderNo);
		
		close(conn);
		
		return st;
	}
	
	public Member selectMember(long orderNo) {
		Connection conn = getConnection();
		
		Member m = new OrderDao().selectMember(conn, orderNo);
		
		close(conn);
		
		return m;
	}
	
	public Delivery selectDelivery(long orderNo) {
		Connection conn = getConnection();
		
		Delivery d = new OrderDao().selectDelivery(conn, orderNo);
		
		close(conn);
		
		return d;
	}
	
	public int updateCancelrequest(long orderNo) {
		Connection conn = getConnection();
		
		int result = new OrderDao().updateCancelrequest(conn, orderNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		return result;
	}
	
	public int deleteOrder(long orderNo) {
		Connection conn = getConnection();
		
		int deliveryNo = new OrderDao().searchDelivery(conn,orderNo);
		int result1 = new OrderDao().deleteOrderProduct(conn, orderNo);
		int result2 = new OrderDao().deleteOrder(conn, orderNo);
		int result3 = new OrderDao().deleteDelivery(conn, deliveryNo);
		
		if(result1>0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1*result2*result3;
	}
	
	

	
	
	
	
	
}
