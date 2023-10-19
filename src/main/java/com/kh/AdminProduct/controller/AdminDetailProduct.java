package com.kh.AdminProduct.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.AdminProduct.model.service.AdminProductService;
import com.kh.AdminProduct.model.vo.AdminProduct;

/**
 * Servlet implementation class AdminDetailProduct
 */
@WebServlet("/detail.pr")
public class AdminDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("bno"));
		
		AdminProductService apService = new AdminProductService();
		
		AdminProduct a = apService.selectProductDetailList(productNo);
		request.setAttribute("b", a);
		request.getRequestDispatcher("views/adminProduct/productDetailList.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
