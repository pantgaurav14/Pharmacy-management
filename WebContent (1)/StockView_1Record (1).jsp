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
<style>

  body{
  color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
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
<title>Drug</title>
</head>
<body>
<a href="Stocks.html">Go Back</a>
<jsp:include page="Drug_name.html"></jsp:include>

<%

try{
	Connection con = DConnection.getCon() ;
Statement stmt=con.createStatement();
String query="select * from Stock where drug_name=?" ;
PreparedStatement ps=con.prepareStatement(query) ;
ps.setString(1,request.getParameter("drug_name"));
ps.executeUpdate() ;
ResultSet rs=ps.executeQuery(query);  
%>
<br><br><br>
<div align="center">
<table id="t01" border="1" cellpadding="5">
    <caption><b>Drug</b></caption>
    <tr>
        <th>Drug_name</th>
        <th>Drug_ID</th>
        <th>Cost</th>
        <th>Quantity</th>
    </tr>
   <%
while(rs.next())
	{%>
	<tr>
	<td><%out.println(rs.getString(1)) ; %></td>
	<td><%out.println(rs.getString(2) ) ; %></td>
	<td><%out.println(rs.getInt(3)) ; %></td>
	<td><%out.println(rs.getInt(4) ) ;%></td>
</tr>
<% } %>
</table>
</div>
<% }
catch(Exception e) {}

%>

</body>
</html>