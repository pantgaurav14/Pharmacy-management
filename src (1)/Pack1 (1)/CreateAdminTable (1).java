package Pack1;
		import java.sql.*;  

import Pack1.DConnection; 
		public class CreateAdminTable { 
		public static void main(String args[]){  
		try{  
			Connection con = DConnection.getCon() ;
			Statement stmt=con.createStatement();  
		String query =  " CREATE TABLE   ADMIN" 
			+	"   (	NAME VARCHAR2(4000),  "
			+		"		EMAIL VARCHAR2(4000),  "
			+		"	PASSWORD VARCHAR2(4000) "
			+			"   ) " ;
		stmt.executeQuery(query);    
		con.close();  
		}catch(Exception e){ System.out.println(e);}  
		}  
		} 