<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="Pack1.DConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{  
	
	Connection con = DConnection.getCon() ;
	Statement stmt=con.createStatement();
String a =request.getParameter("name") ;
String b = request.getParameter("email");
String x = (request.getParameter("phone_no") );
String d = request.getParameter("address");
String c = request.getParameter("password") ;
String query= "insert into CUSTOMERTABLE values(?,?,?,?,?)" ;
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,a);  
ps.setString(2,b);  
ps.setString(3,c); 
ps.setString(4,x); 
ps.setString(5,d); 
ps.executeUpdate() ;
ps.close() ; 
con.close();  
}catch(Exception e){ System.out.println(e);}  
%>
<script>
alert("you are successfully registered") ;
</script>

<jsp:include page="CustomerLogin.html"></jsp:include> 
</body>
</html>