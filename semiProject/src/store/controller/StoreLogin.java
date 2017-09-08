package store.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import store.model.service.StoreService;
import store.model.vo.Store;

/**
 * Servlet implementation class StoreLogin
 */
@WebServlet("/slogin")
public class StoreLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String storeId = request.getParameter("storeId");
		String storePwd = request.getParameter("storePwd");
		
		Store store = new StoreService().selectOne(storeId, storePwd);
		
		RequestDispatcher view = null;
		if(store != null){
			view = request.getRequestDispatcher("index.jsp");
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(-1);
			session.setAttribute("store", store);
			
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "기업 로그인 실패");
			view.forward(request, response);
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
