<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
      <%@page import="Pack1.DConnection" %>
       <%@page import="java.util.*"%>
    <%@page import="Pack1.DrugOrder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Final Order</title>
<script>
$(function() {
    if (window.history && window.history.pushState) {
        window.history.pushState('', null, './');
        $(window).on('popstate', function() {
            // alert('Back button was pressed.');
            document.location.href = '#';
            session=request.getSession() ;
            session.invalidate() ;
            response.sendRedirect("Mainpage.html");
        });
    }
});
</script>
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


h1{
color:red ;
}

</style>

</head>
<body>
<%
boolean status=false;
try{  
	int quant,x ;
Connection con=DConnection.getCon();  
String query="select * from STOCK where drug_name=?" ;
String query2="update STOCK set quantity=? where drug_name=?" ;
String query3="insert into orders values(?,?,?,?,?,?,?)" ;

PreparedStatement ps=con.prepareStatement(query) ;
PreparedStatement ps2 =con.prepareStatement(query2) ;
PreparedStatement ps3 =con.prepareStatement(query3) ;
session=request.getSession() ;
Object obj=session.getAttribute("hashtab");
String a = (session.getAttribute("username") ).toString() ;
String b= session.getAttribute("address").toString() ;
String c = (session.getAttribute("phone_no") ).toString();
if(obj instanceof Hashtable){
	Hashtable<String,Object> hash=(Hashtable<String,Object>)obj;
	for(Map.Entry m:hash.entrySet()){ 
        //System.out.println(m.getKey());
        DrugOrder drug  = (DrugOrder)m.getValue();
        ps.setString(1,drug.getDrugname());
        ps.executeUpdate() ;
        ResultSet rs=ps.executeQuery(); 
        status=rs.next(); 
         x =drug.getQuantity() ;
        if(status){ 
        	quant= (rs.getInt(4) - x );
        	// System.out.println(quant) ;
        	ps2.setInt(1,quant) ;
        	ps2.setString(2,drug.getDrugname()) ;
        	ps2.executeUpdate() ;
        }
        ps3.setString(1, a) ;
        ps3.setString(2, drug.getDrugid()) ;
        ps3.setString(3, drug.getDrugname()) ;
        ps3.setInt(4, drug.getQuantity()) ;
        ps3.setInt(5, drug.getCost()) ;
        ps3.setString(6, c) ;
        ps3.setString(7, b) ;
        ps3.executeUpdate() ;
	}
	hash.clear() ;

}

}catch(Exception e)
{
	e.printStackTrace() ;
}
%>


<h1><b>Order placed successfully</b> </h1>
<br><br><br>
<form action="logout.jsp">
<input type="submit" value="LOGOUT" class="btn">
</form>
</body>
</html>