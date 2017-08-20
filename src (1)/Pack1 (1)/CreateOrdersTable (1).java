package Pack1;
import java.sql.* ;
import Pack1.DConnection; 
public class CreateOrdersTable {
public static void main(String args[])
{
	create_table() ;
}
	public static void create_table()
	{
		try{
			Connection con = DConnection.getCon() ;
			Statement stmt=con.createStatement();
			String query="CREATE TABLE  ORDERS (CLIENT_NAME VARCHAR2(4000),	DRUG_ID VARCHAR2(4000), \n "
					      +" DRUG_NAME VARCHAR2(4000),QUANTITY NUMBER,COST NUMBER,PHONE_NO NUMBER, \n"
	                      + " ADDRESS VARCHAR2(4000)) ;" ;
			 stmt.execute(query);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
