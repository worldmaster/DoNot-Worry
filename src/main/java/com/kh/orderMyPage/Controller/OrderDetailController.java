package com.kh.orderMyPage.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.orderMyPage.model.service.OrderService;
import com.kh.orderMyPage.model.vo.Delivery;
import com.kh.orderMyPage.model.vo.OrderMyPage;
import com.kh.orderMyPage.model.vo.OrderProductMyPage;
import com.kh.orderMyPage.model.vo.StoreMyPage;

/**
 * Servlet implementation class OrderDetailController
 */
@WebServlet("/detail.od")
public class OrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		long orderNo = Long.parseLong(request.getParameter("ono"));
		
		
		OrderService oService = new OrderService();
		
		ArrayList<OrderProductMyPage> list = oService.selectOPList(orderNo);
		OrderMyPage o = oService.selectOrder(orderNo);
		StoreMyPage st = oService.selectStore(orderNo);
		Member m = oService.selectMember(orderNo);
		Delivery d = oService.selectDelivery(orderNo);
		
		request.setAttribute("list", list);
		request.setAttribute("o", o);
		request.setAttribute("st", st);
		request.setAttribute("m", m);
		request.setAttribute("d", d);

		
		request.getRequestDispatcher("views/order/userOrderDetail.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
