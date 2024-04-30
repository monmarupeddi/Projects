package FinalProject;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NewUser {
	private Connection con;
	private BufferedReader reader;
	private static final Logger logger = Logs.getLogger();
	
	public NewUser(Connection con, BufferedReader reader) {
		super();
		this.con = con;
		this.reader = reader;
	}

	public NewUser register() throws SQLException {
//		create table users(phone VARCHAR(50), username VARCHAR(50), password VARCHAR(50)); //table is mysql db
		//the below query populates the db with users
		String query = "INSERT INTO users (phone, username, password)" + " VALUES (?, ?, ?)";
		PreparedStatement st = con.prepareStatement(query);
		System.out.println("\n\tHi! Welcome to FP shopping! Please enter the following details to register your account.");
		try {
			System.out.println("\nPlease enter your Phone:");
			Matcher m;
			Pattern p;
			String regex = "[0-9]+"; //ensure only numbers are given
			String phone1;
			do {
			System.out.println("\nerror: Please enter a valid phone number in numerical form. No alphabets");
			phone1 = reader.readLine();
			
			p = Pattern.compile(regex);
			m = p.matcher(phone1);}
			while (!m.matches());
				
			
			st.setString(1, phone1);
			
			System.out.println("\nPlease enter a username you prefer:");
			String username =  reader.readLine();
			st.setString(2, username);
			System.out.println("\nPlease enter a password:");
			String password = reader.readLine();	
			st.setString(3, password);
			//after the values are prepared execute the query.
	        st.execute();
			
			System.out.println("\n\t***************New User successfully registered*************");
//			System.out.println("Written to database");
			logger.log(Level.INFO, "New user registered with username: " + username);
			System.out.println("\nHi " + username + "! You can now login with your credentials to start shopping. ThankYou");
			
	        } 
	catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
		return null;};

}
