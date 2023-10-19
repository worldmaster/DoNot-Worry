package com.kh.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.order.model.service.OrderService;
import com.kh.order.model.vo.Delivery;
import com.kh.order.model.vo.Order;
import com.kh.order.model.vo.OrderProduct;

/**
 * Servlet implementation class orderController
 */
@WebServlet("/orderend.do")
public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String price = request.getParameter("totalPrice");
        
        
        String orderProductJson = request.getParameter("orderProduct");
        
        
        Gson gson = new Gson();
        ArrayList<OrderProduct> orderProduct = gson.fromJson(orderProductJson, new TypeToken<ArrayList<OrderProduct>>() {}.getType());
        
        
        int storeIdOrder = Integer.parseInt(request.getParameter("storeIdOrder"));
        
        
        
        String orderInfosJson = request.getParameter("orderInfos");
        Order orderInfosObject = gson.fromJson(orderInfosJson, Order.class);

        Long orderNo = orderInfosObject.getOrderNo();
        String orderWay = orderInfosObject.getOrderWay();
        
        Order orderInfo = new Order();
        orderInfo.setOrderNo(orderNo);
        orderInfo.setOrderWay(orderWay);
        orderInfo.setOrderPrice(price);
      
        
        String receiveInfos = request.getParameter("receiveInfos");
        Delivery delObject = gson.fromJson(receiveInfos, Delivery.class);
        Delivery del = new Delivery();
        del.setRecName(delObject.getRecName());
        del.setRecPhone(delObject.getRecPhone());
        del.setRecAddress(delObject.getRecAddress());
        del.setMsg(delObject.getMsg()==null?" ":delObject.getMsg());
        del.setDelDate(delObject.getDelDate());
        
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        
		
		int result = new OrderService().orderInput(orderProduct, storeIdOrder, orderInfo, del, userNo);
		
	
		response.getWriter().print(result);
		
	}

}
