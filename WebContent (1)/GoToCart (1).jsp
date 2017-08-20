<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
    <%@page import="Pack1.DrugOrder"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CART</title>
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

</head>
<body>
<%
// Hashtable ht = new Hashtable();
session=request.getSession() ;
Object obj=session.getAttribute("hashtab");

if(obj instanceof Hashtable){
	Hashtable<String,Object> hash=(Hashtable<String,Object>)obj;
	%>
	 <div align="center">
     <table id="t01" border="1" cellpadding="5">
        <h1> <b>ORDER</b> </h1>
         <tr>
             
             <th>DRUG_NAME</th>
             <th>DRUG_ID</th>
             <th>QUANTITY</th>
             <th>COST</th>
         </tr>
         <%
	for(Map.Entry m:hash.entrySet()){ 
       // System.out.println(m.getKey());
        DrugOrder drug  = (DrugOrder)m.getValue();
        %>
       
           
       	<tr>
       	<td><%out.println(drug.getDrugname()) ; %></td>
       	<td><%out.println(drug.getDrugid() ) ; %></td>
       	<td><%out.println(drug.getQuantity()) ; %></td>
       	<td><%out.println(drug.getCost() ) ;%></td>
       </tr>
       
      <%
	}
         %>
         </table>
</div>
<%
}
%>
<form action="FinalOrder.jsp" method="post">
<input type="submit" value="order" class="btn">
</form>
</body>
</html>