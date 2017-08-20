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
<title>CUSTOMER LOGIN</title>

</head>
<body>
<%
String name , ad , pn;

boolean status=false;  
try{  
Connection con=DConnection.getCon() ;  
Statement stmt=con.createStatement();
String a =request.getParameter("email") ;
String b = request.getParameter("password") ;
PreparedStatement ps=con.prepareStatement("select * from CUSTOMERTABLE where email=? and password=?"); 
ps.setString(1,a);  
ps.setString(2,b);   
ps.executeUpdate() ;
ResultSet rs=ps.executeQuery();  
status=rs.next();  


if(status){  

name = rs.getString(1);
pn=rs.getString(4) ;
ad=rs.getString(5) ;

	session.setAttribute("session","TRUE");  
	session.setAttribute("username",name) ;
	session.setAttribute("phone_no",pn) ;
	session.setAttribute("address",ad) ;
	%>
	 <script>alert("successfully logged in");
		 </script>
		 
	<jsp:include page="CustomerPage.html"></jsp:include>  
	<%
}  
else  
{  

%>


	<script>	alert("sorry,invalid email id or password"); </script>
		
<jsp:include page="CustomerLogin.html"></jsp:include>
	 <%
// response.sendRedirect("CustomerLogin.html"); 

}

}catch(Exception e)
{e.printStackTrace() ; }  
finally{}


%>
</body>
</html>