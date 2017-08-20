<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
    <%@page import="Pack1.DConnection" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
<style>
table {
    width:100%;
}
table, th, td {
    border: 1px solid black;
    
}
th, td {
    padding: 5px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th {
    background-color: black;
    color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
Connection con=DConnection.getCon();
Statement stmt=con.createStatement();
ResultSet r = stmt.executeQuery("select * from temp_order") ;
%>
<div align="center">
<table id ="t01" border="1" cellpadding="5">
    <caption>Drugs</caption> 
    <tr>
        <th>Drug_name</th>
        <th>Drug_ID</th>
        <th>Quantity</th>
        <th>Cost</th>
    </tr>
   
<%
while(r.next())
	{%>
	<tr>
	<td><%out.println(r.getString(1)) ; %></td>
	<td><%out.println(r.getString(2) ) ; %></td>
	<td><%out.println(r.getInt(3)) ; %></td>
	<td><%out.println(r.getInt(4) ) ;%></td>
</tr>
<% } %>
</table>
</div>
<% 
}catch(Exception e)
{
	e.printStackTrace() ;
	
}
%>
<form action="FinalOrder.jsp">
<input type="submit" value="order">
</form>
</body>
</html>