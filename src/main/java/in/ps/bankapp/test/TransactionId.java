package in.ps.bankapp.test;

import java.util.Random;

public class TransactionId {
	public static long generateId() {
		Random r = new Random();
		long generated_no = r.nextLong();
		if (generated_no < 0) {
			generated_no = generated_no * -1;
		}
		return generated_no;
	}


}
