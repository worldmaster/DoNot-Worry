package com.kh.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.order.model.service.PayService;
import com.kh.order.model.vo.Delivery;
import com.kh.order.model.vo.Order;
import com.kh.order.model.vo.OrderProduct;

/**
 * Servlet implementation class payListController
 */
@WebServlet("/paylist.do")
public class payListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		Order o = new PayService().payOrderList(userNo);
		
		Delivery d = new PayService().payDeliveryList(o);
		
		ArrayList<OrderProduct> op = new PayService().payOpList(o);
		
		if(o != null && d != null && op!=null) {
			request.setAttribute("o", o);
			request.setAttribute("d", d);
			request.setAttribute("op",op);
		}
		
		request.getRequestDispatcher("views/order/orderend.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/order/orderend.jsp").forward(request, response);
	}

}
