package FinalProject;

import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ShoppingCart {
	private static ShoppingCart instance;
	private Map<String, ArrayList<Product>> userCart;
	private static final Logger logger = Logs.getLogger();

	// the usercart is a mapping of each username and a list of the product objects
	// representing the cart
	private ShoppingCart() {
		userCart = new HashMap<String, ArrayList<Product>>();

	}

	public Map<String, ArrayList<Product>> getUserCart() {
		return userCart;

	}

	public void addToCart(String username, Product item) {
		userCart.computeIfAbsent(username, x -> new ArrayList<Product>()).add(item);
		logger.log(Level.INFO, "Added item to cart. Username: " + username + ", Product: " + item);
	}

	public void removeFromCart(String username, Product item) {

		if (userCart.get(username) != null) {
			userCart.get(username).remove(item);
		}

	}

//Singleton object. can only be created once.
	public static ShoppingCart getInstance() {
		if (instance == null)
			instance = new ShoppingCart();
		return instance;
	}

}
