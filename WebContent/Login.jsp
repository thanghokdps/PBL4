<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login Page</title>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="Login.css">
</head>
<body>
	<form action="Authenticate" method="post">
		<div class="login">
			<i class="fa fa-empire"></i>
			<h2>Login</h2>
			<div class="group">
				<input type="text" placeholder="Username" name="UserName"><i
					class="fa fa-user"></i>
			</div>
			<div class="group">
				<input type="password" placeholder="Password" name="PassWord"><i
					class="fa fa-lock"></i>
			</div>
			<button>
				<i class="fa fa-send"></i>Login
			</button>
			<p class="fs">
				<a href="#"> Forgot Account? </a>
			</p>
			<p class="ss">
				Don't have an account? <a href="Register.jsp">Register</a>
			</p>
		</div>
	</form>
</body>
</html>