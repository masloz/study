package reply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import good.model.service.GoodService;
import reply.model.service.ReplyService;
import reply.model.vo.Reply;

/**
 * Servlet implementation class replyStoreList
 */
@WebServlet("/rdetail")
public class replyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public replyDetailServlet() {
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

		int storeNo = Integer.parseInt(request.getParameter("storeNum"));

		// 페이지 값 처리용
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수
		int limit = 10;

		// 전달된 페이지값 추출
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ReplyService rService = new ReplyService();

		// 전체 목록 갯수와 해당 페이지별 목록을 리턴받음
		int listCount = rService.getListCount();
		// System.out.println("조회된 목록 갯수 : " + listCount);
		ArrayList<Reply> list = rService.replyDetail(storeNo, currentPage, limit);
		// 총 페이지수 계산 : 목록이 최소 1개일 때 1page로 처리하기 //위해 0.9 더함
		int pageMax = (int) ((double) listCount / limit + 0.9); // 현재 페이지에 보여줄 시작 페이지수 //(1, 11, 21, .......) //현재 페이지가
																// 13page 이면 시작페이지는 11page 가 됭ㅇㅇㅇㅇㅇㅇ
		int startPage = (currentPage / limit) * limit + 1; // 만약, 목록 아래에 보여질 페이지갯수가 10개이면 //끝페이지수는 20페이지가 되어야 함
		int endPage = startPage + limit - 1;
		if (pageMax < endPage) {
			endPage = pageMax;
		}

		if (list != null && list.size() > 0) {
			// 전송할 최종 json 객체
			JSONObject json = new JSONObject();
			JSONArray jarr = new JSONArray();

			for (Reply reply : list) {
				// 한 사람의 정보를 저장할 json 객체
				JSONObject re = new JSONObject();
				re.put("replyNum", reply.getReplyNum());
				re.put("storeNum", reply.getStoreNum());
				re.put("userId", reply.getUserId());
				// json에서 한글 깨짐을 막으려면, java.net.URLEncoder 클래스의 encode() 메소드로 인코딩 처리
				re.put("content", URLEncoder.encode(reply.getContent(), "UTF-8").replace('+', ' '));
				re.put("point", reply.getPoint());
				re.put("replyDate", reply.getReplyDate().toString());
				re.put("good", reply.getGood());

				jarr.add(re);
			}

			json.put("list", jarr);
			json.put("currentPage", currentPage);
			json.put("pageMax", pageMax);
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("listCount", listCount);

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(json.toJSONString());
			out.flush();
			out.close();
		} else {
			response.sendRedirect("/emos/views/reply/replyError.jsp");
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
