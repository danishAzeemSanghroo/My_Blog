package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = null;
		try {
		out = new PrintWriter(response.getOutputStream());
		String userEmail=request.getParameter("userEmail");
        String userPassword=request.getParameter("userPassword");
        
        Map<String,Object> map=com.blog.database.DatabaseManager.getUser(userEmail);
		    if(map.get("userEmail").toString().equals(userEmail) && map.get("userPassword").toString().equals(userPassword)){
		        response.sendRedirect("HomePage.jsp");
		        HttpSession session = request.getSession();
		        session.setAttribute("userId", map.get("userId").toString());
		    }
		    else
		    {
		        response.sendRedirect("login.jsp?msg=invalid");
		    }
		} catch (Exception exc) {
			 response.sendRedirect("login.jsp?msg=invalid");
		    }finally{
		          out.close();
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
