package com.kh.chat.Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chat;

/**
 * Servlet implementation class ChatListController
 */

@WebServlet("/chatListServlet")
public class ChatListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		 // 어떠한 list인지 그 Type을 나타내줌
        String listType = request.getParameter("listType");
        // 만약 없다면 공백 출력
        if (listType == null || listType.equals(""))
            response.getWriter().write("");
         
        else if (listType.equals("today")) response.getWriter().write(getToday());
        else if (listType.equals("ten")) response.getWriter().write(getTen());
        else {
        	
        }try {
        	Integer.parseInt(listType);
        	response.getWriter().write(getID(listType));
        }catch(Exception e) {
        	response.getWriter().write("");
        }

    }
 
    public String getToday() {
 
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        ChatDao ChatDao = new ChatDao();
        // SimpleDateFormat (현재 날짜를 나타내는 format)
        ArrayList<Chat> chatList = ChatDao.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
 
        // 결과가 있을 때 즉 오늘에 시작한 메시지를 모두 담아와서 보내줌
        for (int i = 0; i < chatList.size(); i++) {
            result.append("[{\"value\":\"" + chatList.get(i).getChatName() + "\"},");
            result.append("{\"value\":\"" + chatList.get(i).getChatContent() + "\"},");
            result.append("{\"value\":\"" + chatList.get(i).getChatTime() + "\"}]");
            // i 가 마지막원소가 아니라면 뒤에 더 있다는 의미
            if (i != chatList.size() - 1)
                result.append(",");
        }
        result.append("],\"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
        return result.toString();
    }
    
    public String getTen() {
    	 
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        ChatDao ChatDao = new ChatDao();
        // SimpleDateFormat (현재 날짜를 나타내는 format)
        ArrayList<Chat> chatList = ChatDao.getChatListByRecent(10);
 
        // 결과가 있을 때 즉 오늘에 시작한 메시지를 모두 담아와서 보내줌
        for (int i = 0; i < chatList.size(); i++) {
            result.append("[{\"value\":\"" + chatList.get(i).getChatName() + "\"},");
            result.append("{\"value\":\"" + chatList.get(i).getChatContent() + "\"},");
            result.append("{\"value\":\"" + chatList.get(i).getChatTime() + "\"}]");
            // i 가 마지막원소가 아니라면 뒤에 더 있다는 의미 
            if (i != chatList.size() - 1)
                result.append(",");
        }
        result.append("],\"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}"); 
        return result.toString();
    }
    
    public String getID(String ChatNo) {
   	 
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        ChatDao ChatDao = new ChatDao();
        // SimpleDateFormat (현재 날짜를 나타내는 format)
        ArrayList<Chat> chatList = ChatDao.getChatListByRecent(ChatNo);
 
        // 결과가 있을 때 즉 오늘에 시작한 메시지를 모두 담아와서 보내줌
        for (int i = 0; i < chatList.size(); i++) {
            result.append("[{\"value\":\"" + chatList.get(i).getChatName() + "\"},");
            result.append("{\"value\":\"" + chatList.get(i).getChatContent() + "\"},");
            result.append("{\"value\":\"" + chatList.get(i).getChatTime() + "\"}]");
            // i 가 마지막원소가 아니라면 뒤에 더 있다는 의미 
            if (i != chatList.size() - 1)
                result.append(",");
        }
        result.append("],\"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}"); 
        return result.toString();
    }

}
