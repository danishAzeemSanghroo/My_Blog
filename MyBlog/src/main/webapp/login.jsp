<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>LOGIN</title>
	<style>
		*{
			box-sizing: border-box;
		}
		body{
			background-image: url(blog.jpg);
			background-size: cover;
			background-repeat: no-repeat;
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
			margin-right: 25.3%;
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
		border-radius: 15px;
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
	footer{
		margin-top: 15%;
	}
	</style>
</head>
<body>
<header>
	<h1 class="hd">Blog</h1>
	<div class="main">
		<p1 class="menu"><a href="registration.jsp">Register New User</a></p1>
	</div>
</header>
<div class="tab green">User Login</div>
<form action="UserLogin" class="tab brown" method="post">
                 <%
            String msg=request.getParameter("msg");
            if("invalid".equals(msg))
            {
            %>
            <p class="text-danger">Something went wrong! Try Again</p>
            <%} %>
            
		<br/>Email: <input type="text" name="userEmail" placeholder="Enter Email" required><br/><br/>
		Password: <input type="password" name="userPassword" placeholder="Enter Password" required><br/><br/>
		<input type="submit" value=" LOGIN ">
                

	</form><br/>
</body>
</html>