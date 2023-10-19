package com.kh.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.cart.model.vo.Cart;
import com.kh.member.model.vo.Member;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class CartListController
 */
@WebServlet("/cart.do")
public class CartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		request.getRequestDispatcher("views/cart/cartView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		request.getRequestDispatcher("views/cart/cartView.jsp").forward(request, response);
		
	}

}
