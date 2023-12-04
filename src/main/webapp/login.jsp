<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng kí tài khoản</title>
</head>
<body>
	<h1>ĐĂNG NHẬP TÀI KHOẢN</h1>
	<form name="signin" method = 'post' action='SigninServlet'>
		Username: <input type="text" name="username" value=""><br>
		Password: <input type="password" name="password" value=""><br>
		<input type="submit" name="ok" value='SIGN IN'>
		
	</form>
	<h2 style = "color:red;text-align: center;">Chưa có tài khoản, đăng kí:<a href="SignupServlet?signup=1" >Tại đây</a></h2>
</body>
</html>