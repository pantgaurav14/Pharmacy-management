<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>  
    <%@page import="Pack1.DConnection"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body>
<%
try{  
Connection con=DConnection.getCon(); 
String a =request.getParameter("name") ;
String b = request.getParameter("email");
String c = request.getParameter("password") ;
Statement stmt=con.createStatement();
String query= "insert into Admin values(?,?,?)" ;
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,a);  
ps.setString(2,b);  
ps.setString(3,c); 
ps.executeUpdate() ;
ps.close() ;
}catch(Exception e){ e.printStackTrace();}  
%>

<script>
function myFunction() {
    alert("Successfully Registered");
}
</script>
 <script>
 myFunction() ;
 </script> 
<jsp:include page="AdminLogin.html" />
</body>
</html>