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
	.blue{
		color:blue;
	}
	input[type=text] {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  box-sizing: border-box;
	}
	input[type=textarea] {
	  width: 100%;
	  padding: 100px 100px;
	  margin: 8px 0;
	  box-sizing: border-box;
	}
	</style>
</head>
<body>
<header>
	<h1 class="hd">Blog</h1>
	<div class="main">
		<p1 class="menu"><a href="HomePage.jsp">Back to Home Page</a></p1>
        </div>
</header>
<table class="tab brown hd">
		<tr>
			<td>Create Blog</td>
		</tr>
	</table>

	<table class="tab green" border="0px">
		
		<tr>
			<td>
				<form action="CreateBlog" method="post">
                                                <%
                                                String userId=request.getParameter("userId");
                                                    String msg=request.getParameter("msg");
                                                    if("success".equals(msg))
                                                    {
                                                    %>
                                                    <p class="text-success">Successfully Posted</p>
                                                    <%}%>
                                                    <%
                                                    if("invalid".equals(msg))
                                                    {
                                                    %>
                                                    <p class="text-danger">Something went wrong! Try Again</p>
                                                    <%} %>
                                                    
					<input type="text" name="postTitle" placeholder="Enter Title Here" required><br/><br/>
					<input type="textarea" name="postText" placeholder="Enter Content here" required><br/><br/>
					<input type="text" name="postAuthor" placeholder="Enter Author name" required><br/><br/>
					<input type="hidden" name="userId" value="<%=userId%>" ><br/><br/>
					<input type="submit" value=" Post " text-align="center">
				</form>
			</td>
			
		</tr>  
	</table>
	
	</div>

</body>
</html>