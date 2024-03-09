<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login POST BACK - no database - with Bean and JSTL</title>
</head>
<body>
<!--  JSTL tags can be used to replace much of the Java scriptlets in JSP. 
JSTL tags are classified in five broad groups: 
	- Core: Covers flow control and variable support among other things 
	- XML: Tags to process XML documents 
	- i18n: Tags to support internationalization 
	- SQL: Tags to access database 
	- Functions: Tags to perform some of the common string operations
-->


<!-- 
!!!Important
Download JSTL Libraries for APIs and their implementation
and copy to WEB-INF/lib

 -->

<c:set var="errMsg" value="${null}"/>
<c:set var="displayForm" value="${true}"/>

	<c:if test='${"POST".equalsIgnoreCase(pageContext.request.method) && pageContext.request.getParameter("submit") != null}'>
	
	<!-- id="logicBean" ovvero il nome dell'oggetto della classe specificata in class -->
	<jsp:useBean id='loginBean' class='bean.LoginBean'>
	<!-- facciamo il set degli attributi dell'oggetto logicBean -->
	<jsp:setProperty name='loginBean' property='userName' value='<%=request.getParameter("username")%>' />
	<jsp:setProperty name='loginBean' property='password' value='<%=request.getParameter("password")%>' />
	<!-- attenzione : per gli attributi valori usare ' per poi poter usere " per la parte Java interna
		oppure \ prima di " se si usano " per attributi valore
	 -->
	</jsp:useBean>
	<c:choose>
		<c:when test="${!loginBean.isValidUser()}">
			<c:set var="errMsg" value="Invalid username or password"/>
		</c:when>
		<c:otherwise>
			<h2><c:out value="Welcome Admin!"></c:out></h2>
			<c:set var="displayForm" value="${false }"/>
		</c:otherwise>
	</c:choose>
	</c:if>

	<c:if test="${errMsg!=null}">
		<c:out value="${errMsg }"></c:out>
	</c:if>
	<c:if test="${displayForm }">
	<form method="post">
		<input type="text" name="username" required /> <br />
		<input type="password" name="password" required /> </br>
		<button type="submit" name="submit">Login</button>
	</form>
	</c:if>
</body>
</html>