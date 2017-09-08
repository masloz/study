package store.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.model.service.StoreService;

/**
 * Servlet implementation class StoreIDCheck
 */
@WebServlet("/sidcheck")
public class StoreIDCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreIDCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; utf-8");
		String storeId = request.getParameter("storeId");
		
		String result = new StoreService().idCheck(storeId);
		
		PrintWriter clientOut = response.getWriter();
		
		if(!result.equals(storeId)) {
			clientOut.append("1");	// append(), print(), write()
			clientOut.flush();
		} else {
			clientOut.append("2"); 
			clientOut.flush();
		}
		clientOut.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
