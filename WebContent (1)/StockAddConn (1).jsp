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
<title>ADD STOCK</title>
<style>
  body{
  color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
}

</style>
</head>
<body>
<%
try{
	Connection con = DConnection.getCon() ;
	Statement stmt=con.createStatement();
String query="insert into Stock values (?,?,?,? )" ;
PreparedStatement ps=con.prepareStatement(query) ;
ps.setString(1,request.getParameter("drug_name"));
ps.setString(2,request.getParameter("drug_id"));

ps.setInt(3,Integer.parseInt(request.getParameter("cost")));
ps.setInt(4,Integer.parseInt(request.getParameter("quantity")) );
ps.executeUpdate() ;
%>
<script >
alert("Record added") ;
</script>
<%
}catch(Exception e){ }
%>
<jsp:include page="Stocks.html"></jsp:include> 
</body>
</html>