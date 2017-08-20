<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="Pack1.DConnection" %>
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
Connection con=DConnection.getCon();
String a =request.getParameter("Drug_name") ;
String b = request.getParameter("Drug_id");
int c = Integer.parseInt(request.getParameter("quantity")) ;
int d = Integer.parseInt(request.getParameter("cost"));
String query= "insert into temp_order values(?,?,?,?)" ;
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,a);  
ps.setString(2,b);  
ps.setInt(3,c); 
ps.setInt(4,d) ;
ps.executeUpdate() ;
ps.close() ;
 

}catch(Exception e)
{
	e.printStackTrace() ;
}
%>
<p> drug added to cart </p>
<form action="SearchItem.html">
<input type="submit" value="Order more" >
</form>
<form action="OrderCart.jsp">
<input type="submit" value="Go To Cart" >
</form>
</body>
</html>