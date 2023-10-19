package com.kh.orderMyPage.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.orderMyPage.model.service.OrderService;

/**
 * Servlet implementation class OrderCancelRequestController
 */
@WebServlet("/cancelrq.od")
public class OrderCancelRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCancelRequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminNo = 1;
		
		int result =0;
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		
		long orderNo = Long.parseLong(request.getParameter("ono"));
		
		
		if(userNo == adminNo) {
			result = new OrderService().deleteOrder(orderNo);
		}else {
			result = new OrderService().updateCancelrequest(orderNo);
		}
		
		
		
		
		
		//response.getWriter().print(result);
		//response.sendRedirect(request.getContextPath()+"/list.od");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
