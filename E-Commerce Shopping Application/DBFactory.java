package FinalProject;



public class DBFactory {

	public static DBConnections getConnection(String name, String dbName, String username, String password) {
// check for the type of the db and call the relevant object.
		if (name.equals("MySql"))

		{
			return new MySqlConnection(name, dbName, username, password);
		}  else
			return null;

	}

}
