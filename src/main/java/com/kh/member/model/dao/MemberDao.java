package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.Member;

public class MemberDao {
	
	  private Properties prop = new Properties();

	   public MemberDao() {
		      
		      String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		      
		      try {
		    	  prop.loadFromXML(new FileInputStream(fileName));
		      } catch (IOException e) {
		         e.printStackTrace();
		      }
		      
	   }
	   
	   
	   public Member loginMember(Connection conn, String userId, String userPwd) {
		   
		      
		      //Select문 실행예정 => ResultSet객체에 담아줘야함
		      Member m = null;
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      
		      String sql = prop.getProperty("loginMember");
		      
		      
		      try {
		         pstmt = conn.prepareStatement(sql);
		         
		         //미완성된 sql문 완성시켜주기
		         pstmt.setString(1, userId);
		         pstmt.setString(2, userPwd);
		         
		         
		         rset = pstmt.executeQuery(); //sql을 작성 안 해도됨
		         
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
		      } finally {
		         close(rset);
		         close(pstmt);
		         
		      }
		      
		      return m;
		   }
	
	
	   
	   public int insertMember(Connection conn, Member m) {
		   
		   // insert문 => 처리된 행의 갯수를 반환
		   int result = 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("insertMember");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getbDay());
			pstmt.setString(6, m.getPhone());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		   
	   }
	   
	   
	   
	   public int updateMember(Connection conn, Member m) {
		   
		   int result = 0;
		   
		   PreparedStatement pstmt = null;
		   String userPwd = m.getUserPwd();
		   String newPwd = m.getNewPwd();
		   
		   if(newPwd.equals("")) { // 비밀번호는 변경안할때
			   
			   String sql = prop.getProperty("updateMember");
			   
			   try {
				   pstmt = conn.prepareStatement(sql);
				   
				   pstmt.setString(1, m.getUserId());
				   pstmt.setString(2, m.getUserPwd());
				   pstmt.setString(3, m.getUserName());
				   pstmt.setString(4, m.getbDay());
				   pstmt.setString(5, m.getPhone());
				   pstmt.setString(6, m.getAddress());
				   pstmt.setString(7, m.getUserId());
				   
				   result = pstmt.executeUpdate();
				   
			   } catch (SQLException e) {
				   e.printStackTrace();
			   } finally {
				   close(pstmt);
			   }
			   return result;
		   
		   }else { // 비밀번호를 새로 설정할때
			   
			   String sql = prop.getProperty("updateMember");
			   
			   try {
				   pstmt = conn.prepareStatement(sql);
				   
				   //미완성된 sql문 채워주기
				   pstmt.setString(1, m.getUserId());
				   pstmt.setString(2, m.getNewPwd());
				   pstmt.setString(3, m.getUserName());
				   pstmt.setString(4, m.getbDay());
				   pstmt.setString(5, m.getPhone());
				   pstmt.setString(6, m.getAddress());
				   pstmt.setString(7, m.getUserId());
				   
				   result = pstmt.executeUpdate();
				   
			   } catch (SQLException e) {
				   e.printStackTrace();
			   } finally {
				   close(pstmt);
			   }
			   return result;
		   }
		   
		   
	   }
	   
	   
	   public Member selectMember(Connection conn, String userId, String userName) {
		   
		   // SELECT문 => ResultSet객체 => 조회된 행의 결과가 1행 or 0행
		   Member m = null;
		   
		   PreparedStatement pstmt = null;
		   
		   ResultSet rset = null;
		   
		   String sql = prop.getProperty("selectMember");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			
			
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		   return m;
	   }
	   
	   
	   
	   
	   public int deleteMember(Connection conn, String userId, String userPwd) {
		      
		      int result = 0;
		      
		      PreparedStatement pstmt = null;
		      
		      String sql = prop.getProperty("deleteMember");
		      
		      try {
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setString(1, userId);
		         pstmt.setString(2, userPwd);
		         
		         result = pstmt.executeUpdate();
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         close(pstmt);
		      }
		      return result;
		   }

	   
	   
		public int idCheck(Connection conn, String checkId) {
			
			int count = 0;
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("idCheck");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, checkId);
				
				rset = pstmt.executeQuery(); // 쿼리문 실행
				
				if(rset.next()) {
					 count = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return count ;
		}
	
}
