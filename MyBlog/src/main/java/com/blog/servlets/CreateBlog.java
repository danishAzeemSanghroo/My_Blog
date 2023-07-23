package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CreateBlog
 */
public class CreateBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBlog() {
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
		
        String postTitle=request.getParameter("postTitle");
        String postText=request.getParameter("postText");
        String postAuthor=request.getParameter("postAuthor");
        String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        int userId =Integer.parseInt(request.getParameter("userId"));
       
        //out.println(postTitle+":"+postText+":"+postAuthor+":"+date+":"+userId);
        
	    int row = com.blog.database.DatabaseManager.addPost(postTitle,postText,date,postAuthor,userId);
	        if(row>0)
	        {
	            response.sendRedirect("CreatePost.jsp?msg=success");
	        }
	        else
	        {
	            response.sendRedirect("CreatePost.jsp?msg=invalid");
	        }
		
		} catch (Exception exc) {
			 response.sendRedirect("createPost.jsp?msg=invalid");
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
