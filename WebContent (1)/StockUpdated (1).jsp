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
<title>UPDATE STOCK</title>
<style>
  body{
    color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
}
form {text-align:center;

} 
a:hover, a:active {
    background-color: Orange ;
}

</style>
</head>
<body>
<%

try{
 
	Connection con = DConnection.getCon() ;
Statement stmt=con.createStatement();
int a =Integer.parseInt(request.getParameter("cost")) ;
int b=Integer.parseInt(request.getParameter("quantity")) ;
String c =(request.getParameter("drug_name")).trim() ;
String query="update stock set cost=? ,quantity=? where drug_name=?";
PreparedStatement ps=con.prepareStatement(query) ;
ps.setInt(1,a);
ps.setInt(2,b);
ps.setString(3,c);
int i =ps.executeUpdate() ;
con.close() ;
}catch(Exception e){e.printStackTrace() ;

}
%>
</body>
<script >
alert("Records Updated") ;
</script>
<jsp:include page="Stocks.html"></jsp:include> 
</html>