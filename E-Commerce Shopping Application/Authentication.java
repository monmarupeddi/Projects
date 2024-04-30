package FinalProject;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Authentication {

	private Connection con;
	private BufferedReader reader;
	private static final Logger logger = Logs.getLogger();

	// Constructor with database connection and input reader
	public Authentication(Connection con, BufferedReader reader) {
		super();
		this.con = con;
		this.reader = reader;
	}

	public String authenticateUser() throws IOException, SQLException {
		System.out.println("\t****************HELLO THERE!*****************\nPlease enter your username: ");
		String username = reader.readLine();
		System.out.println("Please enter your password: ");
		String password = reader.readLine();
		Statement statement = con.createStatement();
		ResultSet resultSet = statement
				.executeQuery("Select count(username)  from users where username = \"" + username + "\""); // checks
																											// database
																											// for the
																											// information

		resultSet.next();

		if (resultSet.getInt("count(username)") == 1) // if the username is found.
		{

			ResultSet resultSet1 = statement
					.executeQuery("Select password from users where username =\"" + username + "\"");
			resultSet1.next();
			if (resultSet1.getString("password").equals(password)) {
				logger.log(Level.INFO, "Login attempt: successful." + username);
				System.out.println("\t*******Login Successful.*******\n\tHi " + username + "! Welcome Back");
			}
		} else {
			logger.log(Level.WARNING, "Login attempt: authentication failed.");
			System.out.println(
					"**********Wrong credentials! Please try loggin in again by entering valid credentials or Register if a new user**********");
			username = null;
		}

		return username; // username is null if the username is not registered.

	}

}
