<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
    <%@page import="Pack1.DConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN LOGIN</title>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body>
<%
boolean status=false;  
try{  
	Connection con = DConnection.getCon() ;
	Statement stmt=con.createStatement();
String a =request.getParameter("email") ;
String b = request.getParameter("password") ;
PreparedStatement ps=con.prepareStatement("select * from Admin where email=? and password=?"); 
ps.setString(1,a);  
ps.setString(2,b);   
ps.executeUpdate() ;
ResultSet rs=ps.executeQuery();  
status=rs.next();   
ps.close() ;
}catch(Exception e){ }  
if(status){  
	%>

<script>	alert("successfully logged in"); </script>
	 <%
	 
session.setAttribute("session","TRUE");  
%>
<jsp:include page="Stocks.html"></jsp:include> 
<%
}  
else  
{  
	%>

	<script>	alert("sorry,invalid email id or password"); </script>
		
<jsp:include page="AdminLogin.html"></jsp:include>  
<%
}
%>

</body>
</html>