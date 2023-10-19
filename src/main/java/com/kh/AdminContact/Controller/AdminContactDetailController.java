package com.kh.AdminContact.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminContact.model.service.AdminContactService;
import com.kh.AdminContact.model.vo.AdminContact;

/**
 * Servlet implementation class AdminContactDetailController
 */
@WebServlet("/addetail.co")
public class AdminContactDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminContactDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int contNo = Integer.parseInt(request.getParameter("cno"));
		
		AdminContact ac = new AdminContactService().selectContact(contNo);
		
		request.setAttribute("ac", ac);
		
//		System.out.println("ac값 : " + ac);
		
		request.getRequestDispatcher("views/AdminContact/AdminContactDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		int contNo = Integer.parseInt(request.getParameter("cno"));
//		String adminReply = request.getParameter("adminReply");
//		
////		System.out.println("답변 : " + adminReply);
//		
//		request.setAttribute("cno", contNo);
//		
//		int result = new AdminContactService().adreply(contNo, adminReply);
//		
//		if(result > 0) {
//			request.getSession().setAttribute("alertMsg", "답변이 등록되었습니다");
//			response.sendRedirect(request.getContextPath()+"/addetail.co?cno="+ contNo);
//		}else {
//			request.setAttribute("errorMsg", "답변 등록 실패");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
	}

}
