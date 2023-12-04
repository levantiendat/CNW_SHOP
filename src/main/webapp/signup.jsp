<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng kí tài khoản</title>
</head>
<body>
	<h1>ĐĂNG KÍ TÀI KHOẢN</h1>
	<form name="signup" method = 'post' action='SignupServlet'>
		Username: <input type="text" name="username" value=""><br>
		Password: <input type="password" name="password" value=""><br>
		Name: <input type="text" name="name" value=""><br>
		Email: <input type="text" name="email" value=""><br>
		<input type="submit" name="ok" value='SIGN UP'>
		
	</form>
</body>
</html>