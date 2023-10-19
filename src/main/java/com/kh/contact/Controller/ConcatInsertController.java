package com.kh.contact.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contact.model.service.ContactService;
import com.kh.contact.model.vo.Contact;

/**
 * Servlet implementation class ConcatInsertController
 */
@WebServlet("/insert.bo")
public class ConcatInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConcatInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/contact/contactEnrollView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userNo = request.getParameter("userNo");
		String contact_title = request.getParameter("contact_title");
		String contact_cont = request.getParameter("contact_cont");
		String user_reply = request.getParameter("user_reply");
		
		
		Contact b = new Contact();
		
		b.setContWriter(userNo);
		b.setContTitle(contact_title);
		b.setContCont(contact_cont);
		b.setUserReply(user_reply);
		
		System.out.println(b);
		int result = new ContactService().insertContact(b);
		
		if(result > 0) { //수정 성공=> 상세조회페이지 재요청
			request.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.^^");
			response.sendRedirect(request.getContextPath()+"/list.bo");				
		}else { // 에러페이지로 포워딩
			request.setAttribute("errorMsg", "게시글 수정에 실패했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
