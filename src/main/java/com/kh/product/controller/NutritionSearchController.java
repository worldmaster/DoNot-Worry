package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.NutritionService;
import com.kh.product.model.vo.Nutrition;

/**
 * Servlet implementation class NutritionController
 */
@WebServlet("/nutritionsearchlist.do")
public class NutritionSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NutritionSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String searchKey = (String)request.getParameter("searchNutrition"); //검색어 name값 받아오기! 
		
		//System.out.println(searchKey);
		
		ArrayList<Nutrition> nutritionList = new NutritionService().nutritionSearchList(searchKey);
		
		request.setAttribute("nutritionList", nutritionList);
		
		request.getRequestDispatcher("views/product/nutritionForm.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/nutritionsearchlist.do");
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doGet(request, response);
		

//		
	}

}
