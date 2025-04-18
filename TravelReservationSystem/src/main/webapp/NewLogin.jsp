<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
	String userID = request.getParameter("Username");   //THIS PAGE IS FOR AFTER YOU CREATE A NEW ACCOUNT 
	String pass = request.getParameter("Password");
	String firstName = request.getParameter("FirstName");
	String lastName = request.getParameter("LastName");
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    
    ResultSet rs;
    rs = stmt.executeQuery("select * from customer where customerID='" + userID + "'");
    if (rs.next()) {
    	out.println("Username Exists. Enter a Different Username <a href='SetUpAccount.jsp'>Try Again</a>");
    } else {
    	int x = stmt.executeUpdate("insert into customer values('" +userID+ "','" +firstName+ "','" +lastName+ "', '" +pass+ "')");
    	session.setAttribute("user", userID); 
        response.sendRedirect("ExisitingUser.jsp");

    	
    }
%>

</body>
</html>