package com.kh.AdminProduct.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.AdminProduct.model.dao.AdminProductDao;
import com.kh.AdminProduct.model.vo.AdminNutrition;
import com.kh.AdminProduct.model.vo.AdminProduct;
import com.kh.AdminProduct.model.vo.Attachment;
import com.kh.contact.model.dao.ContactDao;
import com.kh.contact.model.vo.Contact;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

import static com.kh.common.JDBCTemplate.*;

public class AdminProductService {

	public int insertProduct(AdminProduct ap, AdminNutrition an, Attachment at) {
		
	Connection conn = getConnection();
		
		int result3 = 1;//파일정보등록
		if(at != null) {
			result3 = new AdminProductDao().insertProductAttachment(conn,at);
		}
		
		int result1 = new AdminProductDao().insertProduct(conn, ap); //상품등록
		int result2 = new AdminProductDao().insertNutrition(conn,an); //영양정보등록
		
		//트랜잭션 처리
		if(result1>0 && result2 > 0 && result3 > 0) {
			commit(conn);
		     }else {
		    	 rollback(conn);
		     }
		close(conn);

		return result1*result2*result3;
		
		
		
		
	}

	public ArrayList<AdminProduct> selectProductList() {
		Connection conn = getConnection();
		
		ArrayList<AdminProduct> list = new AdminProductDao().selectProductList(conn);
		
		close(conn);
		
		return list;
		

		
	}

	public AdminProduct selectProductDetailList(int productNo) {
		Connection conn = getConnection();
		
		
		
		AdminProduct adp = new AdminProductDao().selectProductDetailList(conn,productNo);
		
		close(conn);
		
		return adp;
		
		
	}

	public int deleteProduct(int productNo) {
		Connection conn = getConnection();
		
		int result = new AdminProductDao().deleteProduct(conn,productNo);
		
		close(conn);
		
		return result;
	}

}
