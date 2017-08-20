<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{  
	System.out.println("Before driver losding");
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");  
	  

//Statement stmt=con.createStatement();  
PreparedStatement ps=con.prepareStatement("insert into Admin values(?,?,?)");  
ps.setString(1,request.getParameter("name"));  
ps.setString(2,request.getParameter("email"));  
ps.setString(3,request.getParameter("password")); 
con.close();  
}catch(Exception e){ System.out.println(e);}  
%>
</body>
</html>