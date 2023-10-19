package com.kh.AdminNotice.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminNotice.model.service.AdminNoticeService;
import com.kh.AdminNotice.model.vo.AdminNotice;

/**
 * Servlet implementation class AdminSearchController
 */
@WebServlet("/search.no")
public class AdminSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		  String searchKey = (String)request.getParameter("searchTitle");
	      
	      ArrayList<AdminNotice> list = new AdminNoticeService().AdminListSearch(searchKey);
	      
//	      System.out.println(searchKey);
	      
	      request.setAttribute("list", list);
	      
//	      response.sendRedirect(request.getContextPath()+ "/search.no?searchTtile="+ searchKey);
	      
	      request.getRequestDispatcher("views/AdminNotice/AdminNoticeListView.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
