<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Pack1.DConnection"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
<style>
  body{
  color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
}
a:hover, a:active {
    background-color: Orange ;
}

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
<title>ORDERS</title>
</head>
<body>
<a href="Stocks.html">Go Back</a>
<%
try{  
	
Connection con=DConnection.getCon() ;  
Statement stmt=con.createStatement();
ResultSet rs = stmt.executeQuery("select * from orders")  ;
%>
<div align="center">
<table id="t01" border="1" cellpadding="5">
    <caption><b>ORDERS</b></caption>
    <tr>
        <th>CLIENT_NAME</th>
        <th>DRUG_ID</th>
        <th>DRUG_NAME</th>
        <th>QUANTITY</th>
        <th>COST</th>
        <th>PHONE_NO</th>
        <th>ADDRESS</th>
    </tr>
   <%
while(rs.next())
	{%>
	<tr>
	<td><%out.println(rs.getString(1)) ; %></td>
	<td><%out.println(rs.getString(2) ) ; %></td>
	<td><%out.println(rs.getString(3)) ; %></td>
	<td><%out.println(rs.getInt(4) ) ;%></td>
	<td><%out.println(rs.getInt(5) ) ;%></td>
	<td><%out.println(rs.getString(6) ) ;%></td>
	<td><%out.println(rs.getString(7) ) ;%></td>
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
</body>
</html>