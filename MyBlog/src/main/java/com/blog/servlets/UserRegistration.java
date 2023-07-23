package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class UserRegistration
 */
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistration() {
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
		
        String userName=request.getParameter("username");
        String userEmail=request.getParameter("userEmail");
        String userPassword=request.getParameter("userPassword");
        String repeatPassword=request.getParameter("repeatPassword");
        String userContact=request.getParameter("userContact");
        String userAddress=request.getParameter("userAddress");
       
        //out.println(userName+":"+userEmail+":"+userPassword+":"+repeatPassword+":"+userContact+":"+userAddress);
        
        Map<String,Object> map=com.blog.database.DatabaseManager.getUser(userEmail);
        
        if(map.isEmpty()) {
        	if(userPassword.equals(repeatPassword)) {
		        int row = com.blog.database.DatabaseManager.addUser(userName,userEmail,userPassword,repeatPassword,userContact,userAddress);
			        if(row>0)
			        {
			            response.sendRedirect("registration.jsp?msg=success");
			        }
			        else
			        {
			            response.sendRedirect("registration.jsp?msg=invalid");
			        }
        	}else {
        		response.sendRedirect("registration.jsp?msg=invalid");
		    	}    
        }else {
        	response.sendRedirect("registration.jsp?msg=exists");
        }
        
		 } catch (Exception exc) {
			 response.sendRedirect("registration.jsp?msg=invalid");
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
