package Pack1;
import java.util.* ;
import Pack1.DrugOrder;
public class hash{
	//DrugOrder drug  = new DrugOrder();
	public static Hashtable<String,DrugOrder> map =new Hashtable<String,DrugOrder>();
	
	public static Hashtable<String,DrugOrder> getHash()
	{
		return map ;
	}
}