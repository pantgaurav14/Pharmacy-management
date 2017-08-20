<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
      <%@page import="Pack1.DConnection" %>
      <%@page import="Pack1.DrugOrder"%>
     
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order here</title>
 <link href="sty.css" rel="stylesheet">
<style>
  body{
    color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
}
form {text-align:center;
border: 3px solid #f1f1f1;

} 
input[type=text] {
    width: 50%;
    padding: 8px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.container {
    padding: 16px;
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
</style>
</head>
<body>
<%

int price=0 ;
boolean status=false;
try{  
	
Connection con=DConnection.getCon();  
String query="select * from STOCK where drug_name=?" ;
PreparedStatement ps=con.prepareStatement(query) ;
ps.setString(1,request.getParameter("drug_name"));
ps.executeUpdate() ;
ResultSet rs=ps.executeQuery();  
status=rs.next();   
int x =Integer.parseInt(request.getParameter("quantity")) ;
if(status){  
if(x <= (rs.getInt(4))  )	
{
	%>
	 <br><br>
	<form action="cart.jsp" method="post">
	<div class="container">
<label><b>Drug Name:</b></label>
	<input type="text" name="Drug_name" value= <% out.print(rs.getString(1)) ;%> > <br><br>
	<label><b>Drug Id : </b></label>
	<input type="text" name="Drug_id" value=  <% out.print(rs.getString(2) );%> > <br><br>
	<label><b>Quantity : </b></label>
	<input type="text" name="quantity" value=<% out.print(x) ; %> > <br><br>
	<%  price=rs.getInt(3)*x ; %>
	<label><b>Cost : </b></label>
	<input type="text" name="cost" value= <% out.print( price)  ; %> > <br><br>
	
	<input type="submit" value="Add to cart" class="btn" >
	</div>
	</form>
	<%
		
}
else
{
	%>
<script>alert("Quantity not available");
	 </script>
	
<jsp:include page="SearchItem.html"></jsp:include> 
<%
}  }
else  
{  
	%>
	 <script>alert("Sorry drug not available");
		 </script>
		
<jsp:include page="SearchItem.html"></jsp:include> 
<%
}

}
catch(Exception e){
 e.printStackTrace() ;
} 

%>

</body>
</html>