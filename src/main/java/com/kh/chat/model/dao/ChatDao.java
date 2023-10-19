package com.kh.chat.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kh.chat.model.vo.Chat;

public class ChatDao {

	private Connection conn;

	
	public ChatDao() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "TEAM";
			String dbPassword = "TEAM";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Chat> getChatList(String nowTime){
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM CHAT WHERE CHAT_TIME > ? ORDER BY CHAT_TIME";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nowTime);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<Chat>();
			while(rs.next()) {
				Chat chat = new Chat();
				chat.setChatNo(rs.getInt("CHAT_NO"));
				chat.setChatName(rs.getString("CHAT_NAME"));
				chat.setChatContent(rs.getString("CHAT_CONTENT").replaceAll(" ", "&nbsp;").replace("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
				chat.setChatTime(rs.getString("CHAT_TIME"));
				chatList.add(chat);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}
	
	public ArrayList<Chat> getChatListByRecent(int number){
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM CHAT WHERE CHAT_NO > (SELECT MAX(CHAT_NO) - ? FROM CHAT) ORDER BY CHAT_TIME";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<Chat>();
			while(rs.next()) {
				Chat chat = new Chat();
				chat.setChatNo(rs.getInt("CHAT_NO"));
				chat.setChatName(rs.getString("CHAT_NAME"));
				chat.setChatContent(rs.getString("CHAT_CONTENT").replaceAll(" ", "&nbsp;").replace("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
				chat.setChatTime(rs.getString("CHAT_TIME"));
				chatList.add(chat);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}
	
	public int submit(String chatName,String chatContent) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO CHAT VALUES(CHATSEQ.NEXTVAL,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, chatName);
			pstmt.setString(2, chatContent);
			return pstmt.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
		
	}

    public int eraseDB() {
        PreparedStatement pstmt = null;
        String SQL = "delete from chat";
        try {
            pstmt = conn.prepareStatement(SQL);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public ArrayList<Chat> getChatListByRecent(String ChatNo) {
        ArrayList<Chat> chatList = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "select * from chat where CHAT_NO > ? order by CHAT_TIME";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(ChatNo));
            rs = pstmt.executeQuery();
            chatList = new ArrayList<Chat>();
            while (rs.next()) {
                Chat chat = new Chat();
                chat.setChatNo(rs.getInt("CHAT_NO"));
                chat.setChatName(rs.getString("CHAT_NAME"));
                chat.setChatContent(rs.getString("CHAT_CONTENT").replaceAll(" ", " ").replaceAll("<", "<")
                        .replaceAll(">", ">").replaceAll("\n", "<br>"));
                chat.setChatTime(rs.getString("CHAT_TIME"));
                chatList.add(chat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return chatList;
    }
}
