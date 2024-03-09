<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Servlet</title>
</head>
<body>
<!--  action path ==> @WebServlet("/Login") in LoginServlet.java -->
	<form action="Login" method="POST">
		<input type="text" name="username" required /> <br/>
		<input type="password" name="password" required /> <br/>
		<button type="submit">Login</button>
	</form>
</body>
</html>