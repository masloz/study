package reply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import good.model.service.GoodService;
import good.model.vo.Good;
import reply.model.service.ReplyService;
import member.model.vo.Member;

/**
 * Servlet implementation class replyGoodInsertServlet
 */
@WebServlet("/rgood")
public class replyGoodInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyGoodInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int rNum = Integer.parseInt(request.getParameter("rNum"));
		int uNum = ((Member) request.getSession().getAttribute("member")).getUserNum();
		System.out.println("uNum: " + uNum);
		Good selectGood =  new GoodService().selectGood(rNum, uNum);
		
		RequestDispatcher view = null;
		int test = 1;
		
		int resultG = 0;
		int resultR = 0;
		
		System.out.println("니가가리하와이" + selectGood);
		if(selectGood == null){
			
			resultG = new GoodService().insertGood(rNum, uNum);
			resultR = new ReplyService().goodUpdate(rNum);
			
			if(resultG > 0 && resultR > 0){
				/*response.sendRedirect("/e/rdetail");*/
				response.getWriter().append("true");
				
			}else{
				response.getWriter().append("false");
			}
			
		}else{
				view = request.getRequestDispatcher("rdetail");
				request.setAttribute("error", test);
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
