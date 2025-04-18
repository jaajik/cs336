<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Found</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You have not logged in<br/>
<a href="Login.jsp">Log Back</a>
<%} else {
%>
Welcome! <%=session.getAttribute("user") %>  
<a href="LogOut.jsp">Log out</a>
<%
    }
%>
</body>
</html>