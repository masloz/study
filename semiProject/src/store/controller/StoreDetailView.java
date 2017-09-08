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
 * Servlet implementation class StoreDetailView
 */
@WebServlet("/sdetail")
public class StoreDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html; charset=utf-8");
		
		int storeNum = Integer.parseInt(request.getParameter("storeNum"));

		Store store = new StoreService().selectOne(storeNum);

		RequestDispatcher view = null;
		if(store != null){
			
			view = request.getRequestDispatcher("views/store/storeDetailView.jsp");
			request.setAttribute("store", store);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "음식점 상세 보기 실패!");
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
