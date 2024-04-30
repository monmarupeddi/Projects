package FinalProject;

import Payment.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserInterface {
	private ProductCatalog catalog;
	private BufferedReader reader;
	private Connection con;
	private static final Logger logger = Logs.getLogger();

	public UserInterface(Connection con, String username, ProductCatalog catalog, BufferedReader reader) {
		super();
		this.con = con;
		this.username = username;
		this.catalog = catalog;
		this.reader = reader;
	}

	private String username;

	public void moveToUser() throws IOException, SQLException {
		int totalPrice = 0;
		while (true) {
			System.out.println(
					"\nPlease enter any of the following options.\n1. Enter '1' to Shop Catalog\n2. Enter '2' to Display Cart Details and Place order\n3. Enter '3' to Log out");
			String input = reader.readLine();

			//displays the catalog items. Can add any item to cart or remove it.
			if (input.equals("1")) {
				while (true) {

					ArrayList<Product> products = catalog.DisplayCatalog();
					System.out.println("\t******************ALL ITEMS*****************");
					for (Product product : products) {
						System.out.println("\t  Product Name: " + product.getName() + "\n\t  ProductID: "
								+ product.getId() + "\n\t  Price: $" + product.getPrice() + "\n\t  Product Category: "
								+ product.getType());
						System.out.println("\t-------------------------------");
					}

					System.out.println(
							"Enter your option:\n\t1. 'add' if you want to add an item to cart\n\t2. 'remove' if you want to remove an item form cart\n\t3. 'close' if you want to exit catalog");
					String ans = reader.readLine();
					// while true
					if (ans.equals("add")) {

						System.out.println("\n\tEnter the id number of the product you want to add to cart");
						String id = reader.readLine();
						int yesorno = 0;
						for (Product product : products) {
							if (product.getId().equals(id)) {
								System.out.println(product);

								new CartBuilder().addProduct(username, product);
								System.out.println("\n\tThe item is added to cart");
								yesorno = 1;
							}
						}
						if (yesorno == 0) {
							System.out.println("\nThe item with " + id
									+ " is not present. Please enter the id of a product present in the catalog.");
							logger.log(Level.WARNING, "ID not present in the catalog.");

						}

					}
					if (ans.equals("remove")) {
						System.out.println("\n\tEnter the id number of the product you want to remove from cart");
						String id = reader.readLine();
						int yesorno = 0;
						Map<String, ArrayList<Product>> cart = new CartBuilder().getCart();
						ArrayList<Product> userCart1 = cart.get(username);

						for (Product product : userCart1) {
							if (product.getId().equals(id)) {
								System.out.println(product);
								new CartBuilder().removeFromCart(username, product);
								yesorno = 1;
								System.out.println("\n\tThe item is removed from the cart\n");
								logger.log(Level.INFO, "Single item is removed from cart.");
								break;
							}
							if (yesorno == 0) {
								logger.log(Level.WARNING, "Item requested not removed because it is not present");
								System.out.println("Item not in catalog\n");
							}
						}

					}

					else if (ans.equals("close")) {
						System.out.println("\t*******Exiting catalog...********");
						break;

					} else
						logger.log(Level.WARNING, "invalid response for catalog shopping");
					System.out.println("\n\t*********Please type appropriate response.**************");
				}

			}

			//Displays the user's cart information. The user can proceed to buy or not.
			else if (input.equals("2")) {
				Map<String, ArrayList<Product>> cart = new CartBuilder().getCart();
				System.out.println("\t***********ITEMS IN YOUR CART***********\n");
				for (Product product : cart.get(username)) {
//				System.out.println("Product Name: " + product.getName() + "\nProductID: " + product.getId()
//				+ "\nPrice $" + product.getPrice() + "\nProduct Category: " + product.getType());
					System.out.println("\t  Product Name: " + product.getName() + "\n\t  ProductID: " + product.getId()
							+ "\n\t  Price: $" + product.getPrice() + "\n\t  Product Category: " + product.getType());
					System.out.println("\t-------------------------------");
					totalPrice += Double.parseDouble(product.getPrice());
				}

				System.out.println("\n\t**************Your total: $" + totalPrice
						+ " **************\n\tDo you want to place the order? (yes/no)");
				String resp = reader.readLine();
				if (resp.equals("yes")) {
					ProcessOrder order = new ProcessOrder(username, totalPrice, reader);
					order.placeOrder();
					totalPrice = 0;
				} else if (resp.equals("no")) {
					System.out.println("Ok! You can continue shopping");
				}

			}

			//finally! the user can logout
			else if (input.equals("3")) {
				System.out.println("\n\t**********LOGGING USER OUT...**************");
				break;
			} else {
				logger.log(Level.WARNING, "Invalid Response.");
			}
		}

	}
}
