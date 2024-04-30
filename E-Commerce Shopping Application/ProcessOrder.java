package FinalProject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import Payment.*;
//import Payment.PaymentGateway;

public class ProcessOrder {
	private String username;
	private double totalPrice;
	private BufferedReader reader;
	private static final Logger logger = Logs.getLogger();

	public ProcessOrder(String username, double totalPrice, BufferedReader reader) {
		super();
		this.username = username;
		this.totalPrice = totalPrice;
		this.reader = reader;
	}

	public boolean placeOrder() throws IOException {
		System.out.println("\tYour total is: " + totalPrice);
		System.out.println("\t*********Confirm the payment? yes/no********");
		boolean issuccess = false;

		// if the user want to proceed, the user will be prompted what gateway they want
		// to use
		// for now there is only one gatway. i.e. paypal. but it can be extended to as
		// many.
		if (reader.readLine().equals("yes")) {
			System.out.println("Enter the payment gatway choice?\n1. paypal");
			if (reader.readLine().equals("paypal")) {
				PaymentGateway pay = new PayPalGateway();
				pay.processPayment(totalPrice);

//clear the cart of the user if all items are bought.
				Map<String, ArrayList<Product>> cart = new CartBuilder().getCart();
				if (cart.containsKey(username)) {
					cart.get(username).clear();

				}
				logger.log(Level.INFO, "Payment is successful for user:  " + username);
//		 new CartBuilder().getCart().get(username).clear();
				issuccess = true;
//		}
			}
		} else {
			System.out.println("Payment failed. Please try again! exiting..");
			logger.log(Level.SEVERE, "Payment failed for user:  " + username);
			issuccess = false;
		}

		return issuccess;

	}
}
