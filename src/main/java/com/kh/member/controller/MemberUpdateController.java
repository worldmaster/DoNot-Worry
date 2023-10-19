package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/member/memberUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String userName = request.getParameter("userName");
		String bDay = request.getParameter("bDay");
		String phone = request.getParameter("phone");
		String[] addressArr = request.getParameterValues("address");
		//String status = (String)request.getSession().getAttribute("status");
		
		//interestArr이 하나의 문자열이 되도록 변경하는 코드!
		String address = "";
		if(addressArr != null) {
			address = String.join(",", addressArr);
		}
		
		Member m = new Member(userId, userPwd, newPwd, userName, address, bDay, phone);
		System.out.println(m);
		
		
		Member updateMember = new MemberService().updateMember(m);
		
		if(updateMember == null) { // 실패
			
			request.setAttribute("errorMsg","회원정보 수정 실패.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else { //성공
			
			// session영역 안에 업데이트된 사용자정보 담아주기
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원정보 수정 성공!"); 
			session.setAttribute("loginUser", updateMember); //같은 키값으로 존재할 수 없음 => 즉 덮어쓰기 가능
			
			// 응답페이지 재요청
			response.sendRedirect(request.getContextPath()+"/beforeupdate.me");
			
		}
		
	}

}
