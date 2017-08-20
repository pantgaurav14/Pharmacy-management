package Pack1;
import java.sql.*;  
class Data{  
public static void main(String args[]){  
try{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","system","java");  
	  

Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from Admin");  
while(rs.next())  
System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
con.close();  
}catch(Exception e){ System.out.println(e);}  
}  
}  