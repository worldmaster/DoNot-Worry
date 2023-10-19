package com.kh.contact.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contact.model.service.ContactService;
import com.kh.notice.model.service.NoticeService;

/**
 * Servlet implementation class ConcatDeleteController
 */
@WebServlet("/delete.bo")
public class ConcatDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConcatDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ContNo = Integer.parseInt(request.getParameter("bno"));
		
		int result = new ContactService().deleteContact(ContNo);
		// 삭제 성공시
		// 성공적으로 공지사항이 삭제되었습니다. => 리스트페이지로 url 재요청보내기
		if(result > 0) {
			request.getSession().setAttribute("alertMsg","성공적으로 공지사항이 삭제되었습니다");
			response.sendRedirect( request.getContextPath() + "/list.bo");
		}else {
			request.setAttribute("errorMsg", "공지사항 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
