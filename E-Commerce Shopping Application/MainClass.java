package FinalProject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class MainClass {

	public static void main(String[] args) throws SQLException, IOException {

		DBConnections sqlc = DBFactory.getConnection("MySql", "OnlineShopping", "root", "Rooting14");
		// check if connection object is returned or is null.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		Connection con = sqlc.connect();

		// Prepare the catalog and populate the db
		ProductCatalog catalog = new ProductCatalog(con);
		ProductFactory factory = new ProductFactory();
		Product one = factory.createProduct("squeaky hen toy", "1", "5", "pets");
		Product two = factory.createProduct("Tennis ball", "2", "10", "pets");
		Product three = factory.createProduct("chew toy", "3", "15", "pets");
		Product four = factory.createProduct("cat tree", "4", "30", "pets");
		Product five = factory.createProduct("automatic feeder", "5", "50", "pets");
		Product six = factory.createProduct("dog shirt", "6", "7", "pets");
		catalog.addProduct(one);
		catalog.addProduct(two);
		catalog.addProduct(three);
		catalog.addProduct(four);
		catalog.addProduct(five);
		catalog.addProduct(six);

		System.out.println("\t\t*******************************");
		System.out.println("\t\t   Welcome to FP shopping\n\t\t*******************************");
		// create a shopping cart
		while (true) {
			System.out.println("\nPlease enter your option:\n\t1. login\n\t2. register\n\t3. exit\n\t");

			String input = reader.readLine();
			if (input.equals("register")) {
				// create a new shopping cart
				// call register class
				NewUser newuser = new NewUser(con, reader);
				newuser.register();
			}

			// if the login is suucessful, the code is moved to the specific user homepage.
			else if (input.equals("login")) {
				Authentication authUser = new Authentication(con, reader);
				String username = authUser.authenticateUser();

				if (username != null) {
					UserInterface ui = new UserInterface(con, username, catalog, reader);
					ui.moveToUser(); // move to users homepage
				}

				System.out.println("\t******User Logged out successfully! Thank You for Shopping.******");

			} else if (input.equals("exit")) {

				break;
			}
		}
		//if exited the application then close the connection to database and terminate.
		con.close();
		System.out.println("Turning off the application.");


	}

}
