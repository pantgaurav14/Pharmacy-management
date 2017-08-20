package Pack1;
		import java.sql.*;  

import Pack1.DConnection; 
		public class CreateStockTable { 
		public static void main(String args[]){  
		try{  
			Connection con = DConnection.getCon() ; 
			  String query=  "CREATE TABLE  STOCK " 
					+"  ( DRUG_NAME VARCHAR2(4000), " 
					+"		DRUG_ID VARCHAR2(4000)," 
					+"		COST NUMBER, "
					+"		QUANTITY NUMBER"
					+"	   )" ;

		Statement stmt=con.createStatement();  
		stmt.executeQuery(query);    
		con.close();  
		}catch(Exception e){ System.out.println(e);}  
		}  
		} 