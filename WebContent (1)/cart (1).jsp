<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Pack1.DrugOrder"%>
     
    <%@page import="java.util.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
          <link href="css/custom.css" rel="stylesheet">
<style>
  body{
  color: black;
	background-color: LightCyan    ;
	background-image: url('img/ph3.jpg')  ;
	
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
input[type=submit] {
    width: 30%;
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

session=request.getSession() ;
DrugOrder drug  = new DrugOrder();
Hashtable<String,DrugOrder> map ;

	
	if( (Hashtable<String,DrugOrder>)session.getAttribute("hashtab") == null  )
	{
		
		map=new Hashtable<String,DrugOrder>();
	}
	else{
		
		 map=(Hashtable<String,DrugOrder>) session.getAttribute("hashtab");
	
	}
	String a = (request.getParameter("Drug_id")) ;
	drug.setDrugname(request.getParameter("Drug_name") ) ;
	drug.setDrugid(a ) ;
	drug.setQuantity(Integer.parseInt(request.getParameter("quantity")) ) ;
	drug.setCost(Integer.parseInt(request.getParameter("cost")) ) ;
	map.put(a,drug);

session.setAttribute("hashtab",map) ;

	

%>
<script>
alert("Drug Added to cart") ;
</script>
<center>
<form action="SearchItem.html" method="post">
<input type="submit" value="Order more" class="btn">
</form>
<br><br>
<form action="GoToCart.jsp" method="post">
<input type="submit" value="Go To Cart" class="btn">
</form>
</center>
</body>
</html>