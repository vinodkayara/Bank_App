package in.ps.bankapp.test;

import java.util.Scanner;

public class test {
	static String acc_type=null;   // to collect the type of the account ,user wants to create
	public static void main(String[] args) {  //program execution point
		int i=0;                   //for
		Scanner sc= new Scanner(System.in);
		System.out.println("Welcome to Bank App");
		do {
			System.out.println("1. SIGNUP");
			System.out.println("2. LOGIN");
			System.out.println("3. FORGOT PIN?");
			System.out.println("4. EXIT");
			
			i=sc.nextInt();
			switch(i) {
			case 1 :
				Signup.signup();
			break;
			case 2 :Login.login();
			break;
			case 3 :
			break;
			case 4  :System.out.println("Application terminated");
			break;
		    default: System.out.println("Invalid choice");
			}
		}
		while(i!=4);
		
		

	}

}
