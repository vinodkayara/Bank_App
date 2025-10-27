package in.ps.bankapp.dao;

import java.util.ArrayList;

import in.ps.bankapp.dto.Transaction;

public interface TransactionDAO {
	public boolean insertTransaction(Transaction t);
	//INSERT INTO TRANSACTION VALUES (0,?,?,?,?,?,?,SYSDATE());
	
	public boolean updateTransaction(Transaction t);
	//UPDATE TRANSACTION SET TRANSACTION_ID=?,SENDER_ACC=?,RECIEVER_ACC=?,AMOUNT=?,TRAN_TYPE=?,BALANCE=?;
	
	public boolean deleteTransaction(int id);
	//DELETE FROM TRANSACTION WHERE ID=?;
	
	public Transaction getTransaction(int id);
	//SELECT * FROM TRANSACTION WHERE ID=?;
	
	public ArrayList<Transaction> getTransactionByCustomerAccno(long acc_no);
	//SELECT * FROM TRANSACTION WHERE SENDER_ACC=?;
	
	public ArrayList<Transaction>  getTransaction();
	//SELECT *  FROM TRANSACTION;
	
	
	

}
