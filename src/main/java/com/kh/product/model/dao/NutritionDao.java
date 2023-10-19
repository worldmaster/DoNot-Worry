package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.vo.Nutrition;

public class NutritionDao {
	
	private Properties prop = new Properties();
	
	
	public NutritionDao() {
		String fileName = NutritionDao.class.getResource("/sql/products/nutrition-mapper.xml").getPath();
	      
	      try {
	         prop.loadFromXML(new FileInputStream(fileName));
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	}
	
	
	public ArrayList<Nutrition> nutritionList(Connection conn) {
		
		ArrayList<Nutrition> nutritionList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nutritionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Nutrition n = new Nutrition(
									rset.getString("PRODUCT_NAME"),
									rset.getInt("KCAL"),
									rset.getInt("SERVING_SIZE"),
									rset.getInt("SUGAR"),
									rset.getInt("PROTEIN"),
									rset.getInt("FAT"),
									rset.getInt("NA"),
									rset.getString("ALLERGY")
									);
				nutritionList.add(n);		
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(nutritionList);
		return nutritionList;
		
	}
	
	public ArrayList<Nutrition> nutritionSearchList(Connection conn, String searchKey) {
		
		 ArrayList<Nutrition> nutritionSearchList = new ArrayList();
	      
	     PreparedStatement pstmt = null;
	      
	     ResultSet rset = null;
	      
	     String sql = prop.getProperty("nutritionSearchList");
		
	     try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchKey);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Nutrition n = new Nutrition();
		            
		        n.setProductName(rset.getString("PRODUCT_NAME"));
		        n.setKcal(rset.getInt("KCAL"));
		        n.setServingSize(rset.getInt("SERVING_SIZE"));
		        n.setSugar(rset.getInt("SUGAR"));
		        n.setProtein(rset.getInt("PROTEIN")); 
		        n.setFat(rset.getInt("FAT")); 
		        n.setNa(rset.getInt("NA")); 
		        n.setAllergy(rset.getString("ALLERGY"));
		        
		        nutritionSearchList.add(n);   
		    }
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
	        close(pstmt);
		}
	     
	    return nutritionSearchList;
	      
	}
	
	
	

	
//	public ArrayList<Nutrition> nutritionSearchList(String searchNkey, Connection conn) {
//		
//	    ArrayList<Nutrition> nutritionList = new ArrayList<>();
//
//	    PreparedStatement pstmt = null;
//	    ResultSet rset = null;
//	    
//	    if(searchNkey.isEmpty()) {
//	    	String sql = prop.getProperty("nutritionList");
//	    	
//	    	try {
//	    		pstmt = conn.prepareStatement(sql);
//	    		
//	    		rset = pstmt.executeQuery();
//
//		        while (rset.next()) {
//		        	Nutrition n = new Nutrition();
//		        			
//	    			n.setProductName(rset.getString("PRODUCT_NAME"));
//	    			n.setKcal(rset.getInt("KCAL"));
//	    			n.setServingSize(rset.getInt("SERVING_SIZE"));
//	    			n.setSugar(rset.getInt("SUGAR"));
//	    			n.setProtein(rset.getInt("PROTEIN"));
//	    			n.setFat(rset.getInt("FAT"));
//	    			n.setNa(rset.getInt("NA"));
//	    			n.setAllergy(rset.getString("ALLERGY"));
//	    			nutritionList.add(n);
//		        }
//	    	}catch (SQLException e) {
//	    		e.printStackTrace();
//		    }finally {
//			    close(rset);
//			    close(pstmt);
//		    }
//	    	return nutritionList; 
//	    	
//	    }else {
//	    	
//	    	String sql = prop.getProperty("searchNutrition");
//	    	
//	    	try {
//	    		pstmt = conn.prepareStatement(sql);
//	    		pstmt.setString(1, '%' + searchNkey + '%');
//	    		rset = pstmt.executeQuery();
//
//		        while (rset.next()) {
//		        	Nutrition n = new Nutrition();
//		        			
//	    			n.setProductName(rset.getString("PRODUCT_NAME"));
//	    			n.setKcal(rset.getInt("KCAL"));
//	    			n.setServingSize(rset.getInt("SERVING_SIZE"));
//	    			n.setSugar(rset.getInt("SUGAR"));
//	    			n.setProtein(rset.getInt("PROTEIN"));
//	    			n.setFat(rset.getInt("FAT"));
//	    			n.setNa(rset.getInt("NA"));
//	    			n.setAllergy(rset.getString("ALLERGY"));
//	    			nutritionList.add(n);
//		        }
//	    	}catch (SQLException e) {
//	    		e.printStackTrace();
//		    }finally {
//			    close(rset);
//			    close(pstmt);
//		    }
//	    	return nutritionList;
//	    	
//	    }
	    
	        
//	        
//	        if(searchNkey.equals("")) {
//	        	pstmt.setString(1,"PRODUCT_NAME");
//	        	
//	        }else {
//	        	pstmt.setString(1, '%' + searchNkey + '%');
//	        }
//	        rset = pstmt.executeQuery();
//
//	        while (rset.next()) {
//	        	Nutrition n = new Nutrition();
//	        			
//    			n.setProductName(rset.getString("PRODUCT_NAME"));
//    			n.setKcal(rset.getInt("KCAL"));
//    			n.setServingSize(rset.getInt("SERVING_SIZE"));
//    			n.setSugar(rset.getInt("SUGAR"));
//    			n.setProtein(rset.getInt("PROTEIN"));
//    			n.setFat(rset.getInt("FAT"));
//    			n.setNa(rset.getInt("NA"));
//    			n.setAllergy(rset.getString("ALLERGY"));
//    			nutritionList.add(n);
//
//	        }
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	    	close(rset);
//            close(pstmt);
//	    }
//	    
//	    return nutritionList; // nutritionList 반환
//	}

	
	
}
