package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {


	public ArrayList<Product> productList() {
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().productList(conn);
		
		close(conn);
		
		return productList;
	}

	public ArrayList<Product> productListSearch(String searchKey) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().productList(searchKey, conn);
		
		close(conn);
		
		return productList;
	}
	
	public ArrayList<Product> productListNewOrder() {
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().productListNewOrder(conn);
		
		close(conn);
		
		return productList;
	}

	public ArrayList<Product> productListNameOrder() {
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().productListNameOrder(conn);
		
		close(conn);
		
		return productList;
	}

	public ArrayList<Product> productListLowOrder() {
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().productListLowOrder(conn);
		
		close(conn);
		
		return productList;
	}

	public ArrayList<Product> productListHighOrder() {
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().productListHighOrder(conn);
		
		close(conn);
		
		return productList;
	}

	public Product productDetail(String productName) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().productDetail(conn, productName);
		
		if(p != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return p;
	}

	

}
