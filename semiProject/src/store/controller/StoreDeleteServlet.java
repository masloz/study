package store.controller;

import java.io.File;
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
 * Servlet implementation class StoreDeleteServlet
 */
@WebServlet("/sdelete")
public class StoreDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int storeNum = Integer.parseInt(request.getParameter("storeNum"));
		String password = request.getParameter("storePwd");
		int result = 0;

//		기존 비밀번호와 비교
		Store store = new StoreService().selectOne(storeNum);
		if (password.equals(store.getStorePwd())) {
			result = new StoreService().deleteStore(storeNum);
		}
		
		RequestDispatcher view = null;
		if (result > 0) {
			// 로그아웃
			HttpSession session = request.getSession(false);
			session.invalidate();
			
//			폴더 및 하위 파일 삭제
			File file = new File(request.getSession().getServletContext().getRealPath("/") + "storeImg\\"  + storeNum);
			if(file.exists()){
				File[] files = file.listFiles();
				for(File f : files){
					f.delete();
				}
				file.delete();
			}

			view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "기업회원 탈퇴 실패!");
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
