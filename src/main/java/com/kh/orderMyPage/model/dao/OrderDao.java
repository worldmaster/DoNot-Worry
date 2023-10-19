package com.kh.orderMyPage.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.sql.Date;

import com.kh.common.model.vo.PageInfo1;
import com.kh.member.model.vo.Member;
import com.kh.orderMyPage.model.vo.Delivery;
import com.kh.orderMyPage.model.vo.OrderMyPage;
import com.kh.orderMyPage.model.vo.OrderListMyPage;
import com.kh.orderMyPage.model.vo.OrderProductMyPage;
import com.kh.orderMyPage.model.vo.StoreMyPage;

public class OrderDao {
   
   int adminNo = 1;
   private Properties prop = new Properties();
   
   public OrderDao() {
      try {
         prop.loadFromXML(new FileInputStream( OrderDao.class.getResource("/sql/order/orderMyPage-mapper.xml").getPath()  ));
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   public int selectListCount(Connection conn, int userNo) {
      
      // SELECT문 => ResultSet객체 (한행)
      int listCount = 0;
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectListCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         if(userNo == adminNo) {
            pstmt.setString(1, "ignore");
            pstmt.setInt(2, userNo);
         }else {
            pstmt.setString(1, "noignore");
            pstmt.setInt(2, userNo);
         }
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
   
   
   public ArrayList<OrderListMyPage> selectListMyPage(Connection conn, PageInfo1 pi, int userNo){
      
      ArrayList<OrderListMyPage> list = new ArrayList();
      
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
         
         if(userNo == adminNo) {
            pstmt.setString(1, "ignore");
            pstmt.setInt(2, userNo);
         }else {
            pstmt.setString(1, "noignore");
            pstmt.setInt(2, userNo);
         }
         pstmt.setInt(3, startRow);
         pstmt.setInt(4, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new OrderListMyPage(
                           rset.getDate("주문날짜"),
                           rset.getString("주문지점"),
                           rset.getString("상품명"),
                           rset.getLong("주문번호"),
                           rset.getString("배송상황"),
                           rset.getString("취소신청"),
                           rset.getString("아이디")
                  ));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }
   
   public ArrayList<OrderProductMyPage> selectOPList(Connection conn, long orderNo){
      
      
      ArrayList<OrderProductMyPage> list = new ArrayList();
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectOPList");

      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setLong(1, orderNo);
         
         rset = pstmt.executeQuery();
         
         
         while(rset.next()) {
            list.add(new OrderProductMyPage(
                           rset.getString("파일경로"),
                           rset.getString("상품명"),
                           rset.getInt("수량"),
                           rset.getString("상품가격"),
                           rset.getInt("결제가격")   
                  ));
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
      
   }
   
   public OrderMyPage selectOrder(Connection conn,long orderNo) {
      
      OrderMyPage o = new OrderMyPage();
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectOrder");

      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setLong(1, orderNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            o = new OrderMyPage(
                     rset.getLong("ORDER_NO"),
                     rset.getInt("USER_NO"),
                     rset.getDate("ORDER_DATE"),
                     rset.getString("ORDER_WAY"),
                     rset.getString("ORDER_PRICE"),
                     rset.getInt("ST_ID"),
                     rset.getInt("DELIVERY_NO"),
                     rset.getString("ORDER_STATUS"),
                     rset.getString("ORDER_CANCEL")
                  );                  
         }
         
         
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return o;
   }
   
   public StoreMyPage selectStore (Connection conn,long orderNo) {
      
      StoreMyPage st = new StoreMyPage();
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectStore");

      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setLong(1, orderNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            st = new StoreMyPage(
                     rset.getInt("ST_ID"),
                     rset.getString("ST_NAME")
                     
                  );                  
         }
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return st;
   }

   public Member selectMember (Connection conn,long orderNo) {
      
      
      Member m = new Member();
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectMember");

      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setLong(1, orderNo);
         
         rset = pstmt.executeQuery();
         if(rset.next()) {
            m = new Member(
                     rset.getInt("USER_NO"),
                     rset.getString("USER_ID"),
                     rset.getString("USER_PWD"),
                     rset.getString("USER_NAME"),
                     rset.getString("ADDRESS"),
                     rset.getString("B_DAY"),
                     rset.getString("PHONE"),
                     rset.getString("STATUS")
                     
                  );                  
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return m;
   }
   
   public Delivery selectDelivery (Connection conn,long orderNo) {
      
      
      Delivery d = new Delivery();
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectDelivery");

      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setLong(1, orderNo);
         
         rset = pstmt.executeQuery();
//         DELIVERY_NO, RECEIVER_NAME, RECEIVER_PHONE, RECEIVER_ADDRESS, MSG, DELIVERY_STATUS, DELIVERY_DATE
         if(rset.next()) {
            d = new Delivery(
                     rset.getInt("DELIVERY_NO"),
                     rset.getString("RECEIVER_NAME"),
                     rset.getString("RECEIVER_PHONE"),
                     rset.getString("RECEIVER_ADDRESS"),
                     rset.getString("MSG"),
                     rset.getString("DELIVERY_STATUS"),
                     rset.getDate("DELIVERY_DATE")
                     
                  );                  
         }
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return d;
   }
   
   public int updateCancelrequest(Connection conn, long orderNo) {
      int result = 0;
      
      PreparedStatement pstmt = null;
      
      
      
      String sql = prop.getProperty("updateCancelrequest");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setLong(1, orderNo);
         
         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      
      return result;
   }
   
   public int searchDelivery(Connection conn, long orderNo) {
      int result = 0;
      
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("searchDelivery");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setLong(1, orderNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            result = Integer.parseInt(rset.getString("DELIVERY_NO"));
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return result;
      
      
   }
   
   
   
   
   
   
   
   public int deleteOrderProduct(Connection conn, Long orderNo) {
      int result = 1;
      
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteOrderProduct");
      
      try {
         pstmt= conn.prepareStatement(sql);
         pstmt.setLong(1, orderNo);
         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
      
   }
   
   public int deleteOrder(Connection conn, Long orderNo) {
      int result = 1;
      
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteOrder");
      
      try {
         pstmt= conn.prepareStatement(sql);
         pstmt.setLong(1, orderNo);
         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
      
   }
   
   public int deleteDelivery(Connection conn, int deliveryNo) {
      int result = 0;
      
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteDelivery");
      
      try {
         pstmt= conn.prepareStatement(sql);
         pstmt.setLong(1, deliveryNo);
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






