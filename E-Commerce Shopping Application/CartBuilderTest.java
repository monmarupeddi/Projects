package FinalProject;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Map;

import org.junit.Test;

public class CartBuilderTest {

	@Test
	public void test() {
		
		Product product = new PetProducts("squeakytoy", "10", "5", "pets");
		Product product1 = new PetProducts("squeakytoy1", "11", "5", "pets");
		ArrayList<Product> prods = new ArrayList<Product>();
		prods.add(product);
		new CartBuilder().addProduct("-1", product);
		new CartBuilder().addProduct("-2", product1);
		Map<String, ArrayList<Product>> cart = new CartBuilder().getCart();
		
		new CartBuilder().removeFromCart("-2", product1);
		assert (cart.get("-1").equals(prods));
		System.out.println("Test passed: Product added to shopping cart successfully.");
//		fail("Not yet implemented");
	}
	
	

}