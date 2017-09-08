package store.controller;

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
 * Servlet implementation class StoreUpdateServlet
 */
@WebServlet("/supdate")
public class StoreUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		
		String storeId = request.getParameter("storeId");
//		String storePwd = request.getParameter("storePwd1");
		
		String storeName = request.getParameter("storeName");
		String storeSerial = request.getParameter("storeSerial");
		String ceo = request.getParameter("ceo");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		String category = request.getParameter("category");
		
		String qr = new StoreService().nullCheck(request.getParameter("qr"));
		String homepage = new StoreService().nullCheck(request.getParameter("homepage"));
		String storeNotice = new StoreService().nullCheck(request.getParameter("storeNotice"));
		String storeIntro = new StoreService().nullCheck(request.getParameter("storeIntro"));
		String storeOriginInfo = new StoreService().nullCheck(request.getParameter("storeOriginInfo"));
		String storeBusinessTime = new StoreService().nullCheck(request.getParameter("storeBusinessTime"));
		
		String storeMinPriceString = request.getParameter("storeMinPrice");
		
		if(storeMinPriceString == null || storeMinPriceString.length() == 0){
			storeMinPriceString = "0";
		}
		int storeMinPrice = Integer.parseInt(storeMinPriceString);
		
		
		
		Store store = new Store(storeId, /*storePwd,*/ storeName, phone, category, ceo, address, qr, storeSerial, homepage, storeIntro, storeOriginInfo, storeNotice, storeBusinessTime, storeMinPrice);

		RequestDispatcher view = null;
		if(new StoreService().updateStore(store) > 0){
			Store updatedStore = new StoreService().selectOne(store.getStoreNum());
			view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("store", updatedStore);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "기업회원 수정 실패");
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
