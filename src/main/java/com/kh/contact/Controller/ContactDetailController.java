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
 * Servlet implementation class ContactDetailController
 */
@WebServlet("/detail.bo")
public class ContactDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));

		ContactService cService = new ContactService();
	
		// 조회수 증가 / 게시글 정보 조회(Board)/ 첨부파일 조회(Attachment)
		
			Contact c = cService.selectContact(boardNo);		
			request.setAttribute("b", c);
			request.getRequestDispatcher("views/contact/contactDetailView.jsp").forward(request, response);
		} 
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
