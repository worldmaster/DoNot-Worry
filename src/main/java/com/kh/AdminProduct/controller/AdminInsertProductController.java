package com.kh.AdminProduct.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.AdminProduct.model.service.AdminProductService;
import com.kh.AdminProduct.model.vo.AdminNutrition;
import com.kh.AdminProduct.model.vo.AdminProduct;
import com.kh.AdminProduct.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminInsertProductController
 */
@WebServlet("/insert.pr")
public class AdminInsertProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/adminProduct/adminInsertProduct.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// request.getParameter("title");
		
		// 폼 전송을 일반방식이 아닌 multipart/form-data로 전송하는경우
		// request로 값을 뽑을수가 없음. 
		// multipart라는 객체에 값을 이관시킨후 다뤄야 한다.
		
		// enctype이 multipart/form-data로 전송되었을 경우에만 내용이 수정되도록 조건을 추가
		if(ServletFileUpload.isMultipartContent(request)) {// 전송방식이 multipart인지 체크/ multipart라면 true 아니라면 false
			
			// 파일 업로드를 위한 라이브러리 : cos.jar
			
			// 1. 전송되는 파일을 처리할 작업 내용(전송되는 파일의 용량제한, 전달된 파이을 저잘할 폴더 경로)
			// 1_1. 전송되는파일 용량 제한하기 => byte단위로 기술해야한다.
			/* 
			 * byte -> kbyte -> mbyte -> gbyte -> tbyte...
			 * 1 kbyte == 1024byte
			 * 1 mbyte == 1024kbyte == 1024 * 1024 byte
			 * 
			 * */
			int maxSize = 10 * 1024 * 1024;// 10Mbyte
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기(String savePath)
			// 세션객체에서 제공하는 getRealPath메소드를 통해 알아내기
			// 다만 WebContents폴더로부터 board_upfiles(저장할폴더)폴더까지의 경로는 매개변수로 제시해줄예정
			// 그리고 결론적으로는 board_upfiles폴더 내부에 파일들이 저장될 예정이기 때문에 /를 하나더 추가해줘야한다.
		
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			System.out.println(savePath);
		
			/*
			 * 2. 전달된 파일명 수정 및 서버에 업로드 작업
			 * - HttpServletRequest request => MultipartRequest multiRequest로 변환해주기
			 * 
			 * 매개변수 생성자로 생성(cos.jar에서 제공하는 객체임)
			 * MultipartRequest multiRequest = new MultipartRequest(request객체, 저장할 폴더 경로, 용량제한, 인코딩값, 파일명 수정 해주는 객체 );
			 * 
			 * 위 구문 한줄 실행만으로 넘어온 첨부파일들이 해당 폴더에 무조건 업로드됨.
			 * 
			 * 그리고 사용자가 올린 파일명은 그대로 해당 폴더에 업로드 하지 않는게 일반적임.
			 * - 같은파일명이 있을 경우 덮어씌워지거나, 에러가 발생할수가 있음
			 * 
			 * 기본적으로 파일며 수정작업을 해주는 객체
			 * - DefaultFileRenamePolicy객체(cos.jar에서 제공)
			 * - 내부적으로 rename()이라는 메소드가 실행이 되면서 파일명 수정이 진행됨
			 * - 기본적으로 동일한 파일명이 존재할 경우 뒤에 간단하게 카운팅된 숫자를 붙여준다.
			 * 
			 * - 하지만 우리 입맛대로 파일명이 절대 안겹치게끔 rename함수를 overriding 할 예정.
			 */
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8" , new MyFileRenamePolicy());
			
			//상품에 대한 정보 삽입
			String prName = multi.getParameter("prName");
			String price  = multi.getParameter("price");
			String prContent = multi.getParameter("prContent");
			String origin = multi.getParameter("origin");
			
			AdminProduct ap = new AdminProduct();
			
			//상품에대한 정보 데이터 set! jsp에서 활용
			ap.setProductName(prName);
			ap.setProductPrice(price);
			ap.setProductExplain(prContent);
			ap.setOrigin(origin);
			
			
			//영양정보에 대한 정보 삽입 상품번호 fk값 걸려있으니까 넣어야됨 뭘로? 시퀀스로 넣으면됨.
			int kcal = Integer.parseInt(multi.getParameter("kcal"));
			int servingSize = Integer.parseInt(multi.getParameter("servingSize"));
			int sugar = Integer.parseInt(multi.getParameter("sugar"));
			int protein = Integer.parseInt(multi.getParameter("protein"));
			int fat = Integer.parseInt(multi.getParameter("fat"));
			int na = Integer.parseInt(multi.getParameter("na"));
			String allergy = (multi.getParameter("allergy"));
			
			//영양정보에대한 데이터 set jsp에서 활용
			AdminNutrition an = new AdminNutrition();
			
			an.setKcal(kcal);
			an.setServingSize(servingSize);
			an.setSugar(sugar);
			an.setProtein(protein);
			an.setFat(fat);
			an.setNa(na);
			an.setAllergy(allergy);
			

			Attachment at = null; // 처음에는 null로 초기화 , 첨부파일이 있다면 그때 객체 생성
			
			if(multi.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multi.getOriginalFileName("upfile")); // 원본명
				at.setChangeName(multi.getFilesystemName("upfile")); // 수정명(실제 서버에 업로드되어있는 파일명)
				at.setFilePath("resources/board_upfiles/");
			}
			
			//4. 서비스 요청
			int result = new AdminProductService().insertProduct(ap,an,at);
			if(result > 0) { // 성공시 => list.bo url재요청보내기
				
				request.getSession().setAttribute("alertMsg", "상품등록성공");
				response.sendRedirect(request.getContextPath()+"/adproduct.no");
			} else { // 실패시 => 업로드 하고자하는 첨부파일이있었을경우, db에 저장실패시 굳이 서버에 보관할 필요가 없다. 
				
				if(at != null) {
					// 삭제하고자하는 파일객체 생성후, delete메소드 호출
					new File(savePath+at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg","상품등록실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("errorMsg", "전송방식이 잘못되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	      }
		}
	

