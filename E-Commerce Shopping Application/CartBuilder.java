package FinalProject;

import java.util.ArrayList;
import java.util.Map;
//uses builder design pattern
public class CartBuilder {
	private ShoppingCart cart;

	
	public CartBuilder() {
		this.cart = ShoppingCart.getInstance();//calls shopping cart instance, which is the same throughout
	}

	//add to cart
	public CartBuilder addProduct(String username, Product item) {
		cart.addToCart(username, item);
		return this;
	}
//remove from cart
	public void removeFromCart(String username, Product item) {
		cart.removeFromCart(username, item);
	}

	//get cart details
	public Map<String, ArrayList<Product>> getCart() {
		return cart.getUserCart();
	}

}
