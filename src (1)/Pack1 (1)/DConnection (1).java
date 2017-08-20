package Pack1;
import java.sql.*;


public class DConnection {
	
	private static Connection con;  
public static Connection getCon(){  
try{  
		
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
}catch(Exception e)
	{
	e.printStackTrace(); 
	}
    return con;  
}  
}
