package in.ps.bankapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.bankapp.connection.Connector;
import in.ps.bankapp.dto.Transaction;

public class TransactionDAOImpl implements TransactionDAO{
	
	private Connection con;
	
	public TransactionDAOImpl() {
		this.con=Connector.getCon();
	}
	

	@Override
	public boolean insertTransaction(Transaction t) {
		String query="INSERT INTO TRANSACTION VALUES(0,?,?,?,?,?,?,SYSDATE())";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1,t.getTransaction_id());
			ps.setLong(2, t.getSender_acc());
			ps.setLong(3, t.getReciever_acc());
			ps.setDouble(4, t.getAmount());
			ps.setString(5, t.getTran_type());
			ps.setDouble(6, t.getBalance());
			
			i=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updateTransaction(Transaction t) {
		String query="UPDATE TRANSACTION SET TRANSACTION_ID=?,SENDER_ACC=?,RECIEVER_ACC=?,AMOUNT=?,TRAN_TYPE=?,BALANCE=?,DATE=SYSDATE() WHERE ID=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, t.getTransaction_id());
			ps.setLong(2,t.getSender_acc());
			ps.setLong(3, t.getReciever_acc());
			ps.setDouble(4,t.getAmount());
			ps.setString(5, t.getTran_type());
			ps.setDouble(6,t.getBalance());
			ps.setString(7, t.getDate());
			ps.setInt(8,t.getId());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
			}else {
				return false;
			}
		}

	@Override
	public boolean deleteTransaction(int id) {
		String query="DELETE FROM CUSTOMER WHERE  ID=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Transaction getTransaction(int id) {
		String query="SELECT * FROM Transaction WHERE ID=?";
		Transaction t=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Transaction();
				t.setId(rs.getInt("id"));
				t.setTransaction_id(rs.getLong("transaction_id"));
				t.setSender_acc(rs.getLong("sender_acc"));
				t.setReciever_acc(rs.getLong("receiver_acc"));
				t.setAmount(rs.getDouble("amount"));
				t.setTran_type(rs.getString("tran_type"));
				t.setBalance(rs.getDouble("balance"));
				t.setDate(rs.getString("date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t;
	}	

	@Override
	public ArrayList<Transaction> getTransactionByCustomerAccno(long acc_no) {
		ArrayList<Transaction> transactions=new ArrayList<Transaction>();
		String query="SELECT * FROM TRANSACTION WHERE SENDER_ACC=?";
		Transaction t=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1,acc_no);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Transaction();
				t.setId(rs.getInt("id"));
				t.setTransaction_id(rs.getLong("transaction_id"));
				t.setSender_acc(rs.getLong("sender_acc"));
				t.setReciever_acc(rs.getLong("reciever_acc"));
				t.setAmount(rs.getDouble("amount"));
				t.setTran_type(rs.getString("tran_type"));
				t.setBalance(rs.getDouble("balance"));
				t.setDate(rs.getString("date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transactions;
	}	
		

	@Override
	public ArrayList<Transaction> getTransaction() {
		ArrayList<Transaction> transactions=new ArrayList<Transaction>();
		String query="SELECT * FROM TRANSACTION";
		Transaction t=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Transaction();
				t.setId(rs.getInt("id"));
				t.setTransaction_id(rs.getLong("transaction_id"));
				t.setSender_acc(rs.getLong("sender_acc"));
				t.setReciever_acc(rs.getLong("reciever_acc"));
				t.setAmount(rs.getDouble("amount"));
				t.setTran_type(rs.getString("tran_type"));
				t.setBalance(rs.getDouble("balance"));
				t.setDate(rs.getString("date"));
				transactions.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transactions;
	}
}