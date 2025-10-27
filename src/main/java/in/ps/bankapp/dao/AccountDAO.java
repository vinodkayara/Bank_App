package in.ps.bankapp.dao;

import java.util.ArrayList;

import in.ps.bankapp.dto.Account;

public interface AccountDAO {
	public boolean insertAccount(Account a);
	//INSERT INTO CLASS VALUES(0,?,?,?,?,SYSDATE());
	
	public boolean updateAccount(Account a);
	//UPDATE ACCOUNT SET  ACC_TYPE=?,BALANCE=? WHERE  ACC_ID=?;
	
	
	public boolean deleteAccount(int acc_id);
	//DELETE FROM ACCOUNT WHERE ACC_ID=?;
	
	public Account getAccount(int acc_id);
	//SELECT * FROM ACCOUNT WHERE ACC_ID=?;
	
	public ArrayList<Account> getAccountByCustomerId(int cid);
	//SELECT * FROM ACCOUNT WHERE CID=?;
	
	public ArrayList<Account> getAccount();
	//SELECT * FROM ACCOUNT;
	
	public Account getAccount(long acc_no);
	//SELECT * FROM ACCOUNT;

	public Account getAccountByAccountNo(long acc_no);
	
	

	
	
}
