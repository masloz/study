package reply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reply.model.service.ReplyService;
import reply.model.vo.Reply;
import store.model.service.StoreService;
import store.model.vo.Store;

/**
 * Servlet implementation class replyInsertServlet
 */
@WebServlet("/rinsert")
public class replyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int storeNum = Integer.parseInt(request.getParameter("storeNum"));
		System.out.println("storeNumm : " + storeNum);
		String rwriter = request.getParameter("rwriter");
		int rstar = Integer.parseInt(request.getParameter("rstar"));
		String rcontent = request.getParameter("rcontent");
		
		Reply r = null;
		r = new Reply(0, 1, rwriter, rcontent, rstar, null, 0);
		int result	= new ReplyService().insertReply(r);
		
		Store store = new StoreService().selectOne(storeNum);
		RequestDispatcher view = null;
		if(result > 0){
			view = request.getRequestDispatcher("/views/store/storeDetailView.jsp");
			request.setAttribute("store", store);
			
			
			view.forward(request, response);
			
		}else{
			response.sendRedirect("/views/reply/replyError.jsp");
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
