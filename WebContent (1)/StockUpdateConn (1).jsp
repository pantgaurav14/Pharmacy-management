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
<title>Insert title here</title>
<style>
  body{
    color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
}
form {text-align:center;
border: 3px solid #f1f1f1;

} 
.btn{
 background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 8px;
}

.container {
    padding: 16px;
}
input[type=text] {
    width: 50%;
    padding: 8px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
</style>

</head>
<body>
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
<form method="post" action="StockUpdated.jsp">
<%
while(rs.next())
{
	
%>
<div class="container">
<label><b>Drug Name:</b></label>
<input type="text" name="drug_name" value="<% out.println(rs.getString(1) ) ; %> " readonly> <br><br>
<label><b>Drug Id:</b></label>
<input type="text" name="drug_id" value="<% out.println(rs.getString(2) ) ; %> " readonly><br><br>
<label><b>Cost :</b></label>
<input type="text" name="cost" value=<% out.println(rs.getInt(3) ) ; %>  ><br><br>
<label><b>Quantity :</b></label>
<input type="text" name="quantity" value=<% out.println(rs.getInt(4) ) ; %>  ><br><br>
<input type="submit" value="update" class="btn">
</div>
<%
}%>
</form>
<%
}catch(Exception e){}
%>
</body>
</html>