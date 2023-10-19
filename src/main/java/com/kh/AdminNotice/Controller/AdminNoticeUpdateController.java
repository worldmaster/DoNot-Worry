package com.kh.AdminNotice.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminNotice.model.service.AdminNoticeService;
import com.kh.AdminNotice.model.vo.AdminNotice;

/**
 * Servlet implementation class AdminNoticeUpdateController
 */
@WebServlet("/adUpdate.no")
public class AdminNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int noticeNo = Integer.parseInt(request.getParameter("ano"));
		
		AdminNotice an = new AdminNoticeService().selectNotice(noticeNo);
		
		request.setAttribute("an", an);
		
		request.getRequestDispatcher("views/AdminNotice/AdminNoticeUpdateView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("ano"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		int result = new AdminNoticeService().updateNotice(noticeNo, title, content);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항 수정 성공");
			response.sendRedirect(request.getContextPath()+"/addetail.no?ano="+noticeNo);
		}else {
			request.setAttribute("errorMsg", "공지사항 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

}
