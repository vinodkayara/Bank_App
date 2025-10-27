package in.ps.bankapp.dao;

import java.util.ArrayList;

import in.ps.bankapp.dto.Customer;

public interface CustomerDAO {
	//CRUD operation
	public boolean insertCustomer(Customer c);
	//INSERT INTO CUSTOMER VALUES(0,?,?,?,?,?,SYSDATE());
	
	public boolean updateCustomer(Customer c);
	//UPDATE CUSTOMER SET FNAME=?,LNAME=?,MAIL=?,PASSWORD=?,WHERE CID=?
	
	public boolean deleteCustomer(int cid);
	//DELETE FROM CUSTOMER WHERE CID=?
	
	public Customer getCustomer(String mail,int pin);
	//SELECT * FROM CUSTOMER WHERE MAIL=? AND PASSWORD=?
	
	public ArrayList<Customer> getCustomer();
	//SELECT* FROM CUSTOMER
	
	public Customer getCustomer(String mail);
	//SELECT * FROM CUSTOMER WHERE MAIL=?
	
	public Customer getCustomer(int cid);

}
