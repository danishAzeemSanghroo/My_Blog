<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.blog.database.DatabaseManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
	<style>
		*{
			box-sizing: border-box;
		}
		body{
			background-image: url(blog.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			margin-left:10%;
			margin-right:10%;
		}
		.hd{
            border:1px blue solid;
			background-color: #FFE5CC;
			border-radius: 5px;
			text-align: center;
			padding:15px;
			margin-left:18%;
			margin-right: 21.3%;
			color:blue;
			font-weight: bold;
			font-size:40px;
		}
		.main{
			border:1px blue solid;
			background-color: #FFE5CC ;
			border-radius: 5px;
			text-align: center;
			margin-left:22%;
			margin-right: 33.3%;
			padding:10px;
			margin-bottom: 10px;
			width:700px;
			color:red;
		}
		.menu{
			border:1px black solid;
			border-radius: 13px;
			background-color: white;
			color:green;
			font-weight: bold;
			font-size:18px;
			text-align: center;
			margin-right:15px;
			padding:5px;
			padding-left: 10px;
			padding-right: 10px;
			width:130px;
		}
		a:hover{
		color:red;
	}
	a:link{
		color: green;
		text-decoration: none;
	}
	.tab{
		border:1px black solid;
		border-radius: 2px;
		background-color: #FFE5CC;
		margin-left: 30%;
		width:450px;
		color:red;
		font-weight: bold;
		font-style:normal;
		text-align:center;
		font-size: 22px;
		margin-bottom:10px;
		padding:10px;
	}
	.yel{
	color:yellow;
	}
	.red{
		color:red;
	}
	.green{
		color:green;
	}
	.brown{
		color:brown;
	}
	.white{
		color:brown;
		font-size: 15px;
	}
	.blue{
		color:blue;
	}
	</style>
</head>
<body>
<header>
	<h1 class="hd">Blog</h1>
	<div class="main">
		<p1 class="menu"><a href="HomePage.jsp">Back</a></p1>
        </div>
</header>
		<%
		int postId=Integer.parseInt(request.getParameter("postId").toString());
		String postTitle=request.getParameter("postTitle").toString();
		String postText=request.getParameter("postText").toString();
	
		%>
<table class="tab brown hd">
		
		<tr>
			<td>ID: "<%=postId %>"</td>
		</tr>
		<tr>
			<td>Title: "<%=postTitle %>"</td>
		</tr>
		<tr>
		    <td>Post: "<%=postText %>"</td>
		</tr>
	</table>


	<table class="tab white" border="0px">
                    <thead>
                      <tr>
                        <th scope="col">Comments</th>

                      </tr>
                    </thead>
                    <tbody>
            <%
            
            try{
           
                            Connection con=DatabaseManager.getConnection();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from comment where postId="+postId);
                            while(rs.next())
                            {
                                  
            %>

                      <tr>
                        <td><%=rs.getString(2) %></td>
                      </tr>
            <% 		}
            }catch(Exception e)
            {
            System.out.println(e);	
            }
            %>         
            
                    </tbody>
	</table>
	
	<table class="tab brown hd">
		<td>
		<form action="Comment" method="post">
		
				<input type="hidden" name="postId" value="<%=postId%>" ">	
				<input type="text" name="comment" placeholder="Enter Your Comment Here" ">	
               
		<input type="submit" value=" Comment ">
		</form>
		</td>
	</table>
	
	</div>

</body>
</html>