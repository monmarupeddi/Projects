package FinalProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection implements DBConnections {

	private String name;
    private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/" ; 
	private final String username;
	private final String password;
	private final String dbName;
	
    
    
// args 1. type of the db connection 2. name of the db 3. username 4. password
	public MySqlConnection(String name,String dbName, String username, String password) {
		super();
		this.name = name;
		this.username =username;
		this.password = password;
		this.dbName = dbName;
	}



	public Connection connect() {
		
		Connection con = null;
		try {
			Class.forName(jdbcDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			String finalUrl = url + dbName; //build the url
			con = DriverManager.getConnection(finalUrl, username, password); 
			System.out.println("The java application is now connected to the given " + name + " database.");
			return con;
			// con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;

	}

	
	
}
