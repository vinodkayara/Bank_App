package in.ps.bankapp.test;

import java.util.ArrayList;
import java.util.Scanner;
import in.ps.bankapp.dao.AccountDAO;
import in.ps.bankapp.dao.AccountDAOImpl;
import in.ps.bankapp.dao.CustomerDAO;
import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dto.Account;
//import in.ps.bankapp.dto.Account;
import in.ps.bankapp.dto.Customer;

public class Admin {

	static CustomerDAO cdao = new CustomerDAOImpl();
	static AccountDAO adao = new AccountDAOImpl();
	static Scanner sc = new Scanner(System.in);

	public static void admin(Customer c) {

		int i = 0;
		do {
			System.out.println("1. Approve Customer");
			System.out.println("2. Approve Account");
			System.out.println("3. View all Customers ");
			System.out.println("4. View all Accounts");
			System.out.println("5. View all Transactions");
			System.out.println("6. Block User/Delete Customer");
			System.out.println("7. Block Account");
			System.out.println("8. Delete Account");
			System.out.println("9. My Account");
			System.out.println("10. Back to main menu");
			i = sc.nextInt();

			switch (i) {
			case 1:
				Customer cu = Admin.customerInfo();
				System.out.println("1.Active");
				System.out.println("2.Inactive");
				int choice = sc.nextInt();
				String status = Admin.statusUpdate(choice);
				cu.setStatus(status);
				boolean res = cdao.updateCustomer(cu);
				if (res) {
					System.out.println("Status Update successful");
				} else {
					System.out.println("Failed to update status");
				}
				break;
			case 2:
				Account ac = Admin.getAccountInfo();
				System.out.println("1.Active");
				System.out.println("2.Inactive");
				int ch = sc.nextInt();
				String s = Admin.statusUpdate(ch);
				ac.setStatus(s);
				boolean r = adao.updateAccount(ac);
				if (r) {
					System.out.println("Status Update successful");
				} else {
					System.out.println("Failed to update status");
				}

				break;
			case 3:
				ArrayList<Customer> customers = cdao.getCustomer();
				System.out.println("All Customer Details");
				System.out.println("------------------------------------------------------------");

				for (Customer c1 : customers) {
					System.out.println("Customer Id: " + c1.getCid());
					System.out.println("First Name: " + c1.getFname());
					System.out.println("Last Name: " + c1.getLname());
					System.out.println("Phone Number: " + c1.getPhone());
//					System.out.println("Mail_Id: " + c1.getMail());
//					System.out.println("Password: " + c1.getPin());
//					System.out.println("Date: " + c1.getDate());
//					System.out.println("Status: " + c1.getStatus());
					System.out.println("------------------------------------------------------------");

				}
				break;
			case 4:
				ArrayList<Account> accounts = adao.getAccount();
				System.out.println("Account Details");
				System.out.println("------------------------------------------------------------");
				for (Account a1 : accounts) {
					System.out.println("Customer_id: " + a1.getCid());
					System.out.println("Account id: " + a1.getAcc_id());
					System.out.println("Account_no: " + a1.getAcc_no());
					System.out.println("Account_Type: " + a1.getAcc_type());
					System.out.println("Balance: " + a1.getBalance());
					System.out.println("Date: " + a1.getDate());
					System.out.println("Status: " + a1.getStatus());
					System.out.println("------------------------------------------------------------");

				}

				break;
			case 5:
				
				break;
			case 6:
//				ArrayList<Customer> cust = cdao.getCustomer();
//				for (Customer c1 : cust) {
//					System.out.println("Customer Id: " + c1.getCid());
//					System.out.println("Customer Name: " + c1.getFname() + " " + c1.getLname());
//					System.out.println("---------------------------------------------------------");
//
//				}
//				System.out.println("enter the customer id you want to delete");
//				int cust_id = sc.nextInt();
//				boolean delete_res = cdao.deleteCustomer(cust_id);
//				if (delete_res) {
//					System.out.println("deleted succesfully");
//				} else {
//					System.out.println("Customer id not found");
//				}
				Customer c2 = Admin.customerInfo();
				c2.setStatus("Inactive");
				boolean delete_res = cdao.updateCustomer(c2);
				if (delete_res) {
					System.out.println("Customer Bolcked Successfully");
				} else {
					System.out.println("Failed to block!");
				}

				break;
			case 7:
				System.out.println("Block Accounts.......");
				Account a2 = Admin.getAccountInfo();
				a2.setStatus("Inactive");
				boolean a_res = adao.updateAccount(a2);
				if (a_res) {
					System.out.println("Account Bolcked Successfully");
				} else {
					System.out.println("Not possible to block!");
				}

				break;
			case 8:
				ArrayList<Account> acc = adao.getAccount();
				System.out.println("");
				for (Account a1 : acc) {
					System.out.println("Account Id: " + a1.getAcc_id());
					System.out.println("Customer Id: " + a1.getCid());
					System.out.println("Account Number: " + a1.getAcc_no());
					System.out.println("---------------------------------------------");

				}
				System.out.println("Enter the Account Id to delete: ");
				int acc_id = sc.nextInt();
				boolean acc_res = adao.deleteAccount(acc_id);
				if (acc_res) {
					System.out.println("account deleted successfully");
				} else {

					System.out.println("enter valid account no");
				}
				break;
			case 9:
				App.options(c);
				break;
			case 10:
				System.out.println("Going to main menu");
				break;
			default:
				System.out.println("Inavalid choice!");

			}

		} while (i != 10);

	}

	public static Account getAccountInfo() {
		ArrayList<Account> accounts = adao.getAccount();
		for (Account a : accounts) {
			System.out.println("Id: " + a.getAcc_id());
			System.out.println("Account Number: " + a.getAcc_no());
			System.out.println("Status: " + a.getStatus());
		}
		System.out.println("enter the id : ");
		int i = sc.nextInt();
		Account a = adao.getAccount(i);

		return a;
	}

	public static String statusUpdate(int i) {
		String status = null;
		if (i == 1) {
			status = "Active";
		} else if (i == 2) {
			status = "Inactive";

		} else {
			System.out.println("Invalid Choice");
			status = "Pending";

		}
		return status;
	}

	public static Customer customerInfo() {
		ArrayList<Customer> customers = cdao.getCustomer();
		for (Customer c : customers) {

			System.out.println("Customer id: " + c.getCid());
			System.out.println("Customer Name: " + c.getFname());
			System.out.println("Status: " + c.getStatus());
		}

		System.out.println("Enter the Cid to update:");
		int id = sc.nextInt();
		Customer c = cdao.getCustomer(id);

		return c;
	}

}