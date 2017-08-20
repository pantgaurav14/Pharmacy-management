package Pack1;
		import java.sql.*;  

import Pack1.DConnection; 
		public class CreateCustomerTable { 
		public static void main(String args[]){  
		try{  
			Connection con = DConnection.getCon() ;
			String query =  " CREATE TABLE  CUSTOMERTABLE (	NAME VARCHAR2(4000), EMAIL VARCHAR2(4000), "
					+ "PASSWORD VARCHAR2(4000),	PHONE_NO VARCHAR2(10), ADDRESS VARCHAR2(4000) ) ";


		Statement stmt=con.createStatement();  
		stmt.executeQuery(query);    
		con.close();  
		}catch(Exception e){ System.out.println(e);}  
		}  
		} 