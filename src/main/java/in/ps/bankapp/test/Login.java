package in.ps.bankapp.test;

import java.util.Scanner;

import in.ps.bankapp.dao.AccountDAO;
import in.ps.bankapp.dao.AccountDAOImpl;

import in.ps.bankapp.dao.CustomerDAO;
import in.ps.bankapp.dao.CustomerDAOImpl;

import in.ps.bankapp.dto.Customer;

public class Login {
public static void login() {
	Scanner sc=new Scanner(System.in);
	System.out.println("LOGIN PAGE");
	System.out.println("Enter the email: ");
	String mail=sc.next();
	System.out.println("Enter the password:");
	int pin=sc.nextInt();
	
	CustomerDAO cdao=new CustomerDAOImpl();
	AccountDAO acdao=new AccountDAOImpl();
	Customer c=cdao.getCustomer(mail,pin);
	if(c!=null) {
		System.out.println("Login Successfull..");
		if(c.getCid()==1) { //1 means it is admin
			System.out.println("Welcom Admin..");
			Admin.admin(c);
		}
		else { //normal
			System.out.println("welcome  "+c.getFname());
			App.options(c);
		}
	}
	else{
		System.out.println("Login failed");
		
	}
	

	
	
			
}
}