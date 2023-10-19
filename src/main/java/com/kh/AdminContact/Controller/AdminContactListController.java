package com.kh.AdminContact.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminContact.model.service.AdminContactService;
import com.kh.AdminContact.model.vo.AdminContact;
import com.kh.common.model.vo.pageBar;
import com.kh.common.model.vo.pageBar;

/**
 * Servlet implementation class AdminContactListController
 */
@WebServlet("/adlist.co")
public class AdminContactListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminContactListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount;
		int currentPage;
		int pageLimit;
		int contactLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new AdminContactService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		contactLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / contactLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		pageBar pb = new pageBar(listCount, currentPage, pageLimit, contactLimit, maxPage, startPage, endPage);
		
		request.setAttribute("pb", pb);
		
		ArrayList<AdminContact> list = new AdminContactService().selectList(pb);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/AdminContact/AdminContactListView.jsp").forward(request, response);
	}
				
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
