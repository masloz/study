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
 * Servlet implementation class StoreInsertServlet
 */
@WebServlet("/sinsert")
public class StoreInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		회원가입 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		
		String storeId = request.getParameter("storeId");
		String storePwd = request.getParameter("storePwd1");
		String storeName = request.getParameter("storeName");
		String storeSerial = request.getParameter("storeSerial");
		String ceo = request.getParameter("ceo");
		String phone = request.getParameter("phone");
		
		StringBuilder sb = new StringBuilder();
		sb.append(request.getParameter("postcode") + ", ");
		sb.append(request.getParameter("address") + ", ");
		sb.append(request.getParameter("address2"));
		String address = sb.toString();
		
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
		
		
//		String homepage = request.getParameter("homepage");
//		String storeNotice = request.getParameter("storeNotice");
//		String storeIntro = request.getParameter("storeIntro");
//		String storeOriginInfo = request.getParameter("storeOriginInfo");
//		String storeBusinessTime = request.getParameter("storeBusinessTime");
//		int storeMinPrice = Integer.parseInt(request.getParameter("storeMinPrice"));
		
		
		Store store = new Store(storeId, storePwd, storeName, phone, category, ceo, address, qr, storeSerial, homepage, storeIntro, storeOriginInfo, storeNotice, storeBusinessTime, storeMinPrice);
		
		
		int result = new StoreService().insertStore(store);
		
		RequestDispatcher view = null;
		if(result > 0) {
//			기업회원의 이미지 폴더 생성
			int storeNum = new StoreService().selectOne(storeId, storePwd).getStoreNum();
			
			new StoreService().insertImage(storeNum);
			File f = new File(request.getSession().getServletContext().getRealPath("/") + "storeImg\\"  + storeNum);
			if(!f.mkdirs()){
				System.out.println("생성실패");
			}
			
			view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("store", store);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/store/storeError.jsp");
			request.setAttribute("message", "기업 가입 실패");
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
