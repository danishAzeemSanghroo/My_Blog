package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Comment
 */
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
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
		
        int postId=Integer.parseInt(request.getParameter("postId"));
        String comment=request.getParameter("comment");
       
        //out.println(postId+":"+comment);
        
	    int row = com.blog.database.DatabaseManager.addComment(comment,postId);
	        if(row>0)
	        {
	            response.sendRedirect("HomePage.jsp?msg=success");
	        }
	        else
	        {
	            response.sendRedirect("HomePage.jsp?msg=invalid");
	        }
		
		} catch (Exception exc) {
			 response.sendRedirect("HomePage.jsp?msg=invalid");
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
