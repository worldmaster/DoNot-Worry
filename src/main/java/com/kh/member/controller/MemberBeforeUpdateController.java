package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberBeforeUpdateController
 */
@WebServlet("/beforeupdate.me")
public class MemberBeforeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBeforeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser == null) {
			request.getRequestDispatcher("views/member/memberLoginForm.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/member/memberBeforeUpdateForm.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");

		 // 세션에서 로그인한 사용자 정보를 가져옴
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
	    // 사용자가 입력한 비밀번호를 가져옴
	    String enteredPwd = request.getParameter("userPwd");

	    if (loginUser.getUserPwd().equals(enteredPwd)) {
	        
	        request.getRequestDispatcher("views/member/memberUpdateForm.jsp").forward(request, response);
	    } else {
	        
	    	request.getSession().setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시입력해주세요");
	        request.getRequestDispatcher("views/member/memberBeforeUpdateForm.jsp").forward(request, response);
	        
	    }
      
      
	}
}
