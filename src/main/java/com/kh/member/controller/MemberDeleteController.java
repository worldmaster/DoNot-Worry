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
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me") //1) 어노테이션 경로 변경
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/memberDeleteForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 로그인한 회원의 정보를 얻어내는 방법
		// 방법1. input type = "hidden"으로 요청시 숨겨서 전달하는 방법.
		// 방법2. session영역에 담겨있는 회원객체로부터 뽑아오기★

		HttpSession session = request.getSession();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().deleteMember(userId, userPwd);
		
		System.out.println(result);
		
		if(result > 0 ) { //회원 탈퇴 성공시 => 로그아웃처리
			
			session.setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
			// invalidate()메소드 사용시 세션이 만료되어서 alert이 되지 않는다
			// removeAttribute를 이용하여 현재 로그인한 사용자의 정보를 지워주는 방식으로 로그아웃 시키기
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		} else { //실패시
			session.setAttribute("alertMsg","회원탈퇴에 실패했습니다. 들어오는건 맘대로지만 나갈때는 아니란다");
			request.getRequestDispatcher("views/member/memberDeleteForm.jsp").forward(request, response);
		}
		
		
		
	}

}
