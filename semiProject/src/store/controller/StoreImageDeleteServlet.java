package store.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.model.service.StoreService;
import store.model.vo.Store;

/**
 * Servlet implementation class StoreImageDeleteServlet
 */
@WebServlet("/simgdel")
public class StoreImageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreImageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int storeNum = Integer.parseInt(request.getParameter("storeNum"));
		String img = request.getParameter("img");
		
		String renameImg = img.substring(0, img.indexOf("."));
		
		
		Store store = new StoreService().selectOne(storeNum);
		RequestDispatcher view = null;
		if(new StoreService().deleteImg(img, renameImg, storeNum) > 0) {
//			기업회원의 이미지 폴더 생성
			
			view = request.getRequestDispatcher("/simg?storeNum=" + storeNum + "&up=0");
			request.setAttribute("store", store);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "이미지 삭제 실패");
			view.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
//		파일 삭제
		File file = new File(request.getSession().getServletContext().getRealPath("/") + "storeImg\\"  + storeNum);
		if(file.exists()){
			File[] files = file.listFiles();
			for(File f : files){
				if(img.equals(f.toString())) {
					f.delete();
				}
			}
			file.delete();
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
