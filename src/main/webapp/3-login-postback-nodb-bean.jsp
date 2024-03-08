<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login POST BACK - no database - with Bean</title>
</head>
<body>

	<%
	String errMsg = null;
	if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("submit") != null) {
	%>
	<!-- id="logicBean" ovvero il nome dell'oggetto della classe specificata in class -->
	<jsp:useBean id='loginBean' class='bean.LoginBean'>
	<!-- facciamo il set degli attributi dell'oggetto logicBean -->
	<jsp:setProperty name='loginBean' property='userName' value='<%=request.getParameter("username")%>' />
	<jsp:setProperty name='loginBean' property='password' value='<%=request.getParameter("password")%>' />
	<!-- attenzione : per gli attributi valori usare ' per poi poter usere " per la parte Java interna
		oppure \ prima di " se si usano " per attributi valore
	 -->
	</jsp:useBean>
	<%
	if (loginBean.isValidUser()) {
		out.println("Welcome " + loginBean.getUserName());
		return;
	} else {
		errMsg = "Ops, Incorrect credentials ";
	}
	}
	%>
	<form method="post">
		<input type="text" name="username" required /> <br />
		<input type="password" name="password" required /> </br>
		<button type="submit" name="submit">Login</button>
		<%
		if (errMsg != null) {
			out.println(errMsg);
		}
		%>
	</form>
</body>
</html>