package com.blog.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;


public class DatabaseManager {
   
    public static Connection getConnection() throws Exception {  
         Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogger","root","root");
        System.out.println("Connection Successful " + con);
        return con;
    }
  
    public static int addUser(String userName, String userEmail, String userPassword, String repeatPassword,
			String userContact, String userAddress) throws Exception{
		String query="INSERT into user (userName,userEmail,userPassword,repeatPassword,contact,address) values ('"+userName+"','"+userEmail+"','"+userPassword+"','"+repeatPassword+"','"+userContact+"','"+userAddress+"') ";
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	} 
    
	public static Map<String,Object> getUser(String userEmail) throws Exception {
 		String query="select * from user where userEmail='"+userEmail+"' ";
                System.out.println(query);
		Statement st=null;
		ResultSet result=null;
        Map<String,Object> map = new HashMap<String,Object>();
		try{
			st=getConnection().createStatement();
			result=st.executeQuery(query);
			
			while(result.next()){
                map.put("userId",result.getInt("userId"));
				map.put("userName",result.getString("userName"));
				map.put("userPassword",result.getString("userPassword"));
				map.put("repeatPassword",result.getString("repeatPassword"));
				map.put("contact",result.getString("contact"));
				map.put("address",result.getString("address"));
				map.put("userEmail",result.getString("userEmail"));
			}
			return map;
		}finally{
			if(result!=null)result.close();
			if(st!=null)st.close();
		} 
	} 

	public static int addPost(String postTitle, String postText, String date, String postAuthor, int userId)throws Exception{
		String query="INSERT into post (postTitle,postText,publicationDate,postAuthor,userId) values ('"+postTitle+"','"+postText+"','"+date+"','"+postAuthor+"',"+userId+") ";
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	} 

	public static int addComment(String comment,int postId)throws Exception{
		String query="INSERT into comment (comment,postId) values ('"+comment+"',"+postId+") ";
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	}
    
}
