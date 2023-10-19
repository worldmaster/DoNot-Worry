/*
 * package com.kh.cart.model.service;
 * 
 * import static com.kh.common.JDBCTemplate.close; import static
 * com.kh.common.JDBCTemplate.commit; import static
 * com.kh.common.JDBCTemplate.getConnection; import static
 * com.kh.common.JDBCTemplate.rollback;
 * 
 * import java.sql.Connection; import java.util.ArrayList;
 * 
 * import com.kh.cart.model.dao.CartDao; import com.kh.cart.model.vo.Cart;
 * import com.kh.product.model.vo.Product;
 * 
 * public class CartService {
 * 
 * public int cartIn(int memberNo, Product p) {
 * 
 * Connection conn = getConnection();
 * 
 * int result = new CartDao().cartIn(conn, memberNo, p);
 * 
 * if(result > 0) { commit(conn); } else { rollback(conn); } close(conn); return
 * result; }
 * 
 * public ArrayList<Cart> cartList(int memberNo) { Connection conn =
 * getConnection();
 * 
 * ArrayList<Cart> cartList = new CartDao().cartList(conn, memberNo);
 * 
 * close(conn);
 * 
 * return cartList; }
 * 
 * }
 */