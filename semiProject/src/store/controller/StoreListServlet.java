package store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.model.service.StoreService;
import store.model.vo.Store;

/**
 * Servlet implementation class StoreListServlet
 */
@WebServlet("/slist")
public class StoreListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String category = request.getParameter("category");

		StoreService sservice = new StoreService();

		ArrayList<Store> list = null;
		if (category.equals("전체메뉴")) {
			list = sservice.selectList();
		} else {
			list = sservice.selectCategoryList(category);
		}

		RequestDispatcher view = null;
		if (list != null && list.size() > 0) {
			view = request.getRequestDispatcher("views/store/storeListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("category", category);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "기업 리스트 조회 실패");
			view.forward(request, response);
		}
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
