<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Postback - no database</title>
</head>
<body>
	<%
	String errMsg = null;
	if (request.getMethod().equalsIgnoreCase("POST")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.equals("admin") && password.equals("admin")) {
			out.println("Welcome " + username);
			return;
		} else {
			errMsg = "Ops, Incorrect credentials ";
		}
	}
	%>
	<form method="post">
		<input type="text" name="username" required /> <br /> <input
			type="password" name="password" required /> </br>
		<button type="submit">Login</button>
		<%
		if (errMsg != null) {
			out.println(errMsg);
		}
		%>
	</form>
</body>
</html>