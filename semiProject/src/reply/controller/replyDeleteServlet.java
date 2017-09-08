package reply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reply.model.service.ReplyService;

/**
 * Servlet implementation class replyDeleteServlet
 */
@WebServlet("/rdelete")
public class replyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setContentType("text/html; charset=utf-8");
				
				int replyNum = Integer.parseInt(request.getParameter("rNum"));
						
				if(new ReplyService().deleteReply(replyNum) > 0){
					/*response.sendRedirect("/e/views/reply/replyDetail.jsp");*/
					response.getWriter().append("true");
				}else{
					RequestDispatcher view = request.getRequestDispatcher("/emos/views/reply/replyError.jsp");
					request.setAttribute("message", "게시글 삭제 처리 실패!");
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
