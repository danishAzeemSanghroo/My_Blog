<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.blog.database.DatabaseManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<link rel="stylesheet" href="TrainCSS.css">
<style>
* {
	box-sizing: border-box;
}

body {
	background-image: url(blog.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	margin-left: 10%;
	margin-right: 10%;
}

.hd {
	border: 1px blue solid;
	background-color: #FFE5CC;
	border-radius: 5px;
	text-align: center;
	padding: 15px;
	margin-left: 18%;
	margin-right: 25.3%;
	color: blue;
	font-weight: bold;
	font-size: 40px;
}

.main {
	border: 1px blue solid;
	background-color: #FFE5CC;
	border-radius: 5px;
	text-align: center;
	margin-left: 20%;
	margin-right: 33.3%;
	padding: 8px;
	margin-bottom: 10px;
	width: 700px;
	color: red;
}

.menu {
	border: 1px black solid;
	border-radius: 13px;
	background-color: white;
	color: green;
	font-weight: bold;
	font-size: 18px;
	text-align: center;
	margin-right: 15px;
	padding: 5px;
	padding-left: 10px;
	padding-right: 10px;
	width: 130px;
}

a:hover {
	color: red;
}

a:link {
	color: green;
	text-decoration: none;
}

.tab {
	border: 1px black solid;
	border-radius: 15px;
	background-color: #FFE5CC;
	margin-left: 10%;
	width: 1000px;
	color: red;
	font-weight: bold;
	font-style: normal;
	text-align: center;
	font-size: 22px;
	margin-bottom: 10px;
	padding: 10px;
}

.yel {
	color: yellow;
}

.red {
	color: red;
}

.green {
	color: green;
}

.brown {
	color: brown;
}

footer {
	margin-top: 15%;
}
</style>
</head>
<body>
	<%
		String userId = (String)session.getAttribute("userId");
		%>
	
		<h1 class="hd">Blogs</h1>
		<div class="main">
			<p1 class="menu">
			<a href="CreatePost.jsp?userId=<%=userId%>">Create New Blog</a></p1>
			<p1 class="menu">
			<a href="login.jsp">Logout</a></p1>
		</div>
	
	<table class="tab green" >
		<thead>
			<tr>
				<th scope="col">Post-Id</th>
				<th scope="col">Post-Title</th>
				<th scope="col">Post-Text</th>
				<th scope="col">Publication-Date</th>
				<th scope="col">Author</th>
				<th scope="col">Check And Comment</th>

			</tr>
		</thead>
		<tbody>

			<%
            
            try{
            	int postId;
            	String postTitle;
            	String postText;
                       Connection con=DatabaseManager.getConnection();
                       Statement st=con.createStatement();
                       ResultSet rs=st.executeQuery("select * from post");
                       while(rs.next())
                       {
                    	   postId =   rs.getInt(1);
                    	   postTitle = rs.getString(2);
                    	   postText = rs.getString(3);
            %>

			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><p><%=rs.getString(2) %></p></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td>
					<form action="comment.jsp" method="post">
						
						<input type="hidden" name="postId" value="<%=postId%>">
						<input type="hidden" name="postTitle" value="<%=postTitle%>">
						<input type="hidden" name="postText" value="<%=postText%>">
				         
						<input type="submit" value=" Comment ">
					</form>
				</td>
			</tr>
			<% 		
            }
	            }catch(Exception e)
	            { 
	            System.out.println(e);	
	            }
            %>
		</tbody>
	</table>


</body>
</html>