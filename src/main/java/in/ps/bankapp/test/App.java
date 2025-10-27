package in.ps.bankapp.test;

import java.util.ArrayList;
import java.util.Scanner;

import in.ps.bankapp.dao.AccountDAO;
import in.ps.bankapp.dao.AccountDAOImpl;
import in.ps.bankapp.dao.CustomerDAO;
import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dao.TransactionDAO;
import in.ps.bankapp.dao.TransactionDAOImpl;
import in.ps.bankapp.dto.Account;
import in.ps.bankapp.dto.Customer;
import in.ps.bankapp.dto.Transaction;

public class App {
	static CustomerDAO cdao = new CustomerDAOImpl();
	static AccountDAO adao = new AccountDAOImpl();
	static TransactionDAO tdao = new TransactionDAOImpl();
	static Scanner sc = new Scanner(System.in);

	public static void options(Customer c) {
		int cid = c.getCid();
		int choice = 0;
		do {
			System.out.println("1. View Accounts");
//			System.out.println("2. Check Balance");
			System.out.println("2. Deposit");
			System.out.println("3. Transfer Amount");
			System.out.println("4. View Passbook");
//			System.out.println("6. Add Fund for FD");
			System.out.println("5. Exit");
			choice = sc.nextInt();

			switch (choice) {
			case 1:

				ArrayList<Account> l = adao.getAccountByCustomerId(c.getCid());
//				System.out.println(c.getCid());
				
				for (Account a1 : l) {
					System.out.println("Account Number : " + a1.getAcc_no());
					System.out.println("Account Type : " + a1.getAcc_type());
					System.out.println("Account Balance : " + a1.getBalance());
					System.out.println("Status : " + a1.getStatus());
					System.out.println("----------------------------------");

				}
				break;
				
			case 2:
				ArrayList<Account> acc_depo = adao.getAccountByCustomerId(c.getCid());
//				System.out.println(c.getCid());
				System.out.println("-----------------------------------------");
//				Account acc = null;
				for (Account a : acc_depo) {
					System.out.println("Account Id: " + a.getAcc_id());
					System.out.println("Account Number:" + a.getAcc_no());

					System.out.println("Account Type : " + a.getAcc_type());
					System.out.println("Balance: " + a.getBalance());
					System.out.println("-----------------------------------------");
//					acc = a;

				}
				System.out.println("enter the account number:");
				long a_no = sc.nextLong();
				Account a = adao.getAccount(a_no);
				if (a != null) {
					System.out.println("Enter amount :");
					double amt = sc.nextDouble();
					a.setBalance(amt + a.getBalance());
					boolean result = adao.updateAccount(a);
					System.out.println(result);

					if (result) {
						Transaction t = new Transaction();
						t.setTransaction_id(TransactionId.generateId());
						t.setSender_acc(a_no);
						t.setReciever_acc(cid);
						t.setAmount(amt);
						t.setBalance(a.getBalance());
						t.setTran_type("SELF");
						boolean t_res = tdao.insertTransaction(t);
						if (t_res) {
							System.out.println("amount" + amt + "debited successful");
						} else {
							System.out.println("fail to debit");
						}

					} else {
						System.out.println("failed to update");
					}
				} else {
					System.out.println("account is blocked or pending!");
				}

				break;
			case 3:
				ArrayList<Account> acc_list1 = adao.getAccountByCustomerId(c.getCid());
				for (Account a1 : acc_list1) {
					System.out.println("Account Number : " + a1.getAcc_no());
					System.out.println("Account Type : " + a1.getAcc_type());
					System.out.println("Account Balance : " + a1.getBalance());
					System.out.println("Status : " + a1.getStatus());
					System.out.println("----------------------------------");
					System.out.println("-----------------------------------------");
//					acc = a;

				}
				System.out.println("enter the account number:");
				long acc_no = sc.nextLong();
				Account a1 = adao.getAccountByAccountNo(acc_no);
				if (a1 != null) {
					System.out.println("Enter amount :");
					double amt = sc.nextDouble();
					a1.setBalance(amt + a1.getBalance());
					boolean result = adao.updateAccount(a1);

					if (result) {
						Transaction t = new Transaction();
						t.setTransaction_id(TransactionId.generateId());
						t.setSender_acc(a1.getAcc_no());
						t.setReciever_acc(a1.getAcc_no());
						t.setAmount(amt);
						t.setBalance(a1.getBalance());
						t.setTran_type("self");
						boolean t_res = tdao.insertTransaction(t);
						if (t_res) {
							System.out.println("amount" + amt + "credited successful");
						} else {
							System.out.println("fail to credit");
						}

					} else {
						System.out.println("failed to update");
					}
				} else {
					System.out.println("account is blocked or pending!");

				}
				break;
				
			case 4:
				ArrayList<Account> acc_transfer = adao.getAccountByCustomerId(c.getCid());
				System.out.println("-----------------------------------------");
//				Account acc = null;
				for (Account a5 : acc_transfer) {
					System.out.println("Account Id: " + a5.getAcc_id());
					System.out.println("Customer Id:" + a5.getCid());
					System.out.println("Account Number:" + a5.getAcc_no());

					System.out.println("Account Type : " + a5.getAcc_type());
					System.out.println("Balance: " + a5.getBalance());
					System.out.println("-----------------------------------------");
//					acc = a;

				}
				System.out.println("Enter your account number (sender):");
				long senderAccNo = sc.nextLong();
				System.out.println("Enter receiver account number:");
				long receiverAccNo = sc.nextLong();
				System.out.println("Enter amount to transfer:");
				double amount = sc.nextDouble();
				System.out.println("enter the pin:");
				int pin = sc.nextInt();

				if (pin == c.getPin() && senderAccNo != receiverAccNo) {
					Account sender = adao.getAccountByAccountNo(senderAccNo);
					Account receiver = adao.getAccountByAccountNo(receiverAccNo);

					if (sender != null && receiver != null) {
						if (amount <= sender.getBalance() && amount > 0) {
							sender.setBalance(sender.getBalance() - amount);
							receiver.setBalance(receiver.getBalance() + amount);

							boolean senderUpdate = adao.updateAccount(sender);
							boolean receiverUpdate = adao.updateAccount(receiver);

							if (senderUpdate && receiverUpdate) {
								Transaction t1 = new Transaction();
								long t_id = TransactionId.generateId();
								t1.setTransaction_id(t_id);
								t1.setSender_acc(sender.getAcc_no());
								t1.setReciever_acc(receiver.getAcc_no());
								t1.setAmount(amount);
								t1.setBalance(sender.getBalance());
								t1.setTran_type("debit");
								boolean s_res = tdao.insertTransaction(t1);

								Transaction t2 = new Transaction();
								t2.setTransaction_id(t_id);
								t2.setSender_acc(receiver.getAcc_no());
								t2.setReciever_acc(sender.getAcc_no());
								t2.setAmount(amount);

								t2.setBalance(receiver.getBalance());
								t2.setTran_type("credit");
								boolean r_rse = tdao.insertTransaction(t2);
								if (s_res && r_rse) {
									System.out.println("Transfer successful!");
								}

								else {
									System.out.println("Transfer failed");
								}
							}
						} else {
							System.out.println("Insufficient balance!");
						}
					} else {
						System.out.println("Invalid account number");
					}
				} else {
					System.out.println("Cannot transfer to the same account");
				}

				break;



			}

		} while (choice != 5);

	}
}