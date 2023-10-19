package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.NutritionDao;
import com.kh.product.model.vo.Nutrition;

public class NutritionService {
	
	public ArrayList<Nutrition> nutritionList() {
	      
	      Connection conn = getConnection();
	      
	      ArrayList<Nutrition> nutritionList = new NutritionDao().nutritionList(conn);
	      
	      close(conn);
	      
	      return nutritionList;
	   }
	
	
	
	public ArrayList<Nutrition> nutritionSearchList(String searchKey){
		  
		  Connection conn = getConnection();
	      
	      ArrayList<Nutrition> nutritionSearchList = new NutritionDao().nutritionSearchList(conn, searchKey);
	      
	      close(conn);
	      
	      return nutritionSearchList;
	}
	
}
