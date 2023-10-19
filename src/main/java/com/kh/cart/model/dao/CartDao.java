/*
 * package com.kh.cart.model.dao;
 * 
 * import java.io.FileInputStream; import java.io.IOException; import
 * java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.sql.SQLException; import java.util.ArrayList;
 * import java.util.Properties;
 * 
 * import com.kh.cart.model.vo.Cart; import com.kh.product.model.vo.Product;
 * 
 * import static com.kh.common.JDBCTemplate.*;
 * 
 * public class CartDao {
 * 
 * private Properties prop = new Properties();
 * 
 * public CartDao() {
 * 
 * String fileName =
 * CartDao.class.getResource("/sql/cart/cart-mapper.xml").getPath();
 * 
 * try { prop.loadFromXML(new FileInputStream(fileName)); } catch (IOException
 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
 * 
 * }
 * 
 * public int cartIn(Connection conn, int memberNo, Product p) {
 * 
 * int result = 0;
 * 
 * PreparedStatement pstmt = null;
 * 
 * ResultSet rs = null;
 * 
 * String sql = prop.getProperty("cartIn");
 * 
 * try { pstmt = conn.prepareStatement(sql);
 * 
 * pstmt.setInt(1, p.getProductNo());
 * 
 * pstmt.setInt(2, memberNo);
 * 
 * result = pstmt.executeUpdate();
 * 
 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
 * 
 * return result; }
 * 
 * public ArrayList<Cart> cartList(Connection conn, int memberNo) {
 * 
 * ArrayList<Cart> cartList = new ArrayList();
 * 
 * PreparedStatement pstmt = null;
 * 
 * ResultSet rs = null;
 * 
 * String sql = prop.getProperty("cartList");
 * 
 * try { pstmt = conn.prepareStatement(sql);
 * 
 * rs = pstmt.executeQuery();
 * 
 * while(rs.next()) { Cart c = new Cart();
 * 
 * c.setCartNo(rs.getInt("CART_NO"));
 * c.setProductName(rs.getString("PRODUCT_NAME"));
 * c.setUserNo(rs.getInt("USER_NO")); c.setProductQty(rs.getInt("PRODUCT_QTY"));
 * 
 * cartList.add(c); } } catch (SQLException e) { e.printStackTrace(); } finally
 * { close(pstmt); close(conn); }
 * 
 * 
 * return cartList; }
 * 
 * }
 */