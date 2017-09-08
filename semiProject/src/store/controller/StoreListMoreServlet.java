package store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import store.model.service.StoreService;
import store.model.vo.Store;

/**
 * Servlet implementation class StoreListMoreServlet
 */
@WebServlet("/slistmore")
public class StoreListMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreListMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		String category = request.getParameter("category");
		
		ArrayList<Store> listMore = new StoreService().selectListMore(page, category);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(Store s : listMore){
			//한 사람의 정보를 저장할 json 객체
			JSONObject job = new JSONObject();
			job.put("storeNum", s.getStoreNum());
			job.put("storeName", URLEncoder.encode(s.getStoreName(), "UTF-8").replace("+", " "));
			job.put("phone", s.getPhone());
			job.put("category", URLEncoder.encode(s.getCategory(), "UTF-8").replace("+", " "));
			job.put("address", URLEncoder.encode(s.getAddress(), "UTF-8").replace("+", " "));
			job.put("qr", s.getQr());
			job.put("main", new StoreService().selectStoreImg(s.getStoreNum()).getImgMain());
			jarr.add(job);
		}
		
		json.put("list", jarr);
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
