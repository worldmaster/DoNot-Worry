package com.kh.AdminContact.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminContact.model.service.AdminContactService;

/**
 * Servlet implementation class AdminContactDeleteController
 */
@WebServlet("/addelete.co")
public class AdminContactDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminContactDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int contNo = Integer.parseInt(request.getParameter("cno"));
		
		int result = new AdminContactService().deleteCont(contNo);
		
		if(result > 0){
			request.getSession().setAttribute("alertMsg", "건의사항이 삭제되었습니다");
			response.sendRedirect(request.getContextPath()+ "/adlist.co");
		}else {
			request.setAttribute("errorMsg", "건의사항 삭제 실패");
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
