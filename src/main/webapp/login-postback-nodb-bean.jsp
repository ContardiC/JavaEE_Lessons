<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login POST BACK - no database</title>
</head>
<body>

	<%
	String errMsg = null;
	if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("submit")!=null) {
		%>
		<jsp:useBean id="loginBean" class="spacecoding.it.bean.LogicBean">
		<jsp:setProperty name="logicBean" property="userName"
		value="<%request.getParameter("username"); %>"/>
		<jsp:setProperty name="loginBean" property="password" value="<% request.getParameter("password"); %>"/>
		</jsp:useBean>
		<% 
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		if (loginBean.isValidUser()) {
			out.println("Welcome " + userName);
			return;
		} else {
			errMsg = "Ops, Incorrect credentials ";
		}
	}
	%>
	<form method="post">
		<input type="text" name="userName" required /> <br /> <input
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