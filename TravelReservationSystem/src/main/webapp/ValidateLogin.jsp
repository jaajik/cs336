<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Credentials Validation</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
<%
    String userID = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from customer where customerID='" + userID + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from customer where customerID='" + userID + "' and password='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("user", userID); // the username will be stored in the session
    	        response.sendRedirect("ExisitingUser.jsp");
    	    } else {
    	        out.println("Invalid Password <a href='Login.jsp'>Try Again</a>");
    	    }
    }
    else{
    	out.println("Nonexistent Username <a href= 'SetUpAccount.jsp'>SetUp An Account</a>");
    }
%>

</body>
</html>