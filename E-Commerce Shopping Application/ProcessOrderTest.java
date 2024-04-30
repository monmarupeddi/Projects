package FinalProject;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.junit.Test;

public class ProcessOrderTest {

	@Test
	public void test() throws IOException {
		Product product1 = new PetProducts("squeakytoy2", "13", "5", "pets");
		ArrayList<Product> prods = new ArrayList<Product>();
//		NewUser user1 = new NewUser("");
		new CartBuilder().addProduct("-3", product1);
		BufferedReader reader1 = new BufferedReader(new InputStreamReader(System.in));
		String username = "lily";
		
		ProcessOrder po = new ProcessOrder(username, 20.0,  reader1) ;
		
//			System.out.println(po.placeOrder());
			assertTrue(po.placeOrder());
	}

}
