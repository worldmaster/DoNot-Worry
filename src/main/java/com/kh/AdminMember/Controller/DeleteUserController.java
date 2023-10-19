package com.kh.AdminMember.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminMember.model.service.AdminManageUserService;

/**
 * Servlet implementation class DeleteUserController
 */
@WebServlet("/addelete.us")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		String status = request.getParameter("status");
		
		System.out.println("delete status 값 : " + status);
		
		int result = new AdminManageUserService().deleteUser(userNo, status);
		
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원 삭제 성공");
			response.sendRedirect(request.getContextPath()+ "/adlist.us");
		}else {
			request.setAttribute("errorPage", "회원 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		int userNo = Integer.parseInt(request.getParameter("uno"));
//		String status = request.getParameter("status");
//		
//		System.out.println("delete status 값 : " + status);
//		
//		int result = new AdminManageUserService().deleteUser(userNo, status);
//		
//		
//		if(result > 0) {
//			request.getSession().setAttribute("alertMsg", "회원 삭제 성공");
//			response.sendRedirect(request.getContextPath()+ "/adlist.us");
//		}else {
//			request.setAttribute("errorPage", "회원 삭제 실패");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
		
	}

}
