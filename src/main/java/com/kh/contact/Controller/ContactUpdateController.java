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
 * Servlet implementation class ContactUpdateController
 */
@WebServlet("/update.bo")
public class ContactUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContactService bService = new ContactService();
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		Contact b = bService.selectContact(boardNo);
		
		request.setAttribute("b", b);
		
		request.getRequestDispatcher("views/contact/contactUpdateView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 3. 본격적으로 SQL문 실행시 필요한 값들 뽑아오기.
		// - Board테이블에 update시 필요한 데이터

		
		int contNo =Integer.parseInt(request.getParameter("bno"));
		String contact_title = request.getParameter("contact_title");
		String contact_cont = request.getParameter("contact_cont");
		String user_reply = request.getParameter("user_reply");
		String admin_reply = request.getParameter("admin_reply");
		
		
		Contact b = new Contact();
		b.setContNo(contNo);
		b.setContTitle(contact_title);
		b.setContCont(contact_cont);
		b.setUserReply(user_reply);
		b.setAdminReply(admin_reply);
		
		int result = new ContactService().updateContact(b);
		
		if(result > 0) { //수정 성공=> 상세조회페이지 재요청
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다^^");
			response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+contNo);				
		}else { // 에러페이지로 포워딩
			request.setAttribute("errorMsg", "게시글 수정에 실패했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
