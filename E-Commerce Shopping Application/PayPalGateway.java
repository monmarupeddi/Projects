package Payment;

public class PayPalGateway implements PaymentGateway{

	@Override
	public boolean processPayment(double amount) {
		System.out.println("Payment processed successfully for amount: $" + amount);
        return true;
		
	}
	
}