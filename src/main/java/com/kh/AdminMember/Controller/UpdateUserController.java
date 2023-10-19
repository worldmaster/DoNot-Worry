package com.kh.AdminMember.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.AdminMember.model.service.AdminManageUserService;
import com.kh.AdminMember.model.vo.AdminManageUser;

/**
 * Servlet implementation class UpdateUserController
 */
@WebServlet("/adupdate.us")
public class UpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		
//		String status = request.getParameter("status");
		
		AdminManageUser aaa = new AdminManageUserService().updateUserDetail(userNo);
		
		System.out.println("aaa값 : " + aaa);
		System.out.println("userNo값 : " + userNo);
		
//		request.setAttribute("status", status);
		request.setAttribute("uno", userNo);
		request.setAttribute("aaa", aaa);
		
		
		request.getRequestDispatcher("views/AdminMember/updateUser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		String userName = request.getParameter("userName");
		String bDay = request.getParameter("bDay");
		String phone = request.getParameter("phone");
		String[] addressArr = request.getParameterValues("address");
		
		String address = "";
		if(addressArr != null) {
			address = String.join(",", addressArr);
		}
	
		AdminManageUser am = new AdminManageUser();
		am.setUserNo(userNo);
		am.setUserName(userName);
		am.setbDay(bDay);
		am.setPhone(phone);
		am.setAddress(address);
		
		int result = new AdminManageUserService().updateUser(am);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원정보 수정 성공");
			response.sendRedirect(request.getContextPath()+"/adlist.us");
			request.setAttribute("aaa", am);
		}else {
			request.setAttribute("errorMsg", "회원정보 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
