package FinalProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductCatalog {
	private Connection con;
	private static final Logger logger = Logs.getLogger();

	public ProductCatalog(Connection con) {
		super();
		this.con = con;
	}

//	String query = "INSERT INTO users (phone, username, password)" + " VALUES (?, ?, ?)";
//	PreparedStatement st = con.prepareStatement(query);

	// add products to the db, using sql commands
	public void addProduct(Product product) throws SQLException {
		// create table cat(name VARCHAR(100), id VARCHAR(100), price VARCHAR(100))
		String query = "INSERT INTO cat (name, id, price, type)" + " VALUES (?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, product.getName());
		st.setString(2, product.getId());
		st.setString(3, product.getPrice());
		st.setString(4, product.getType());
		st.execute();

		logger.log(Level.INFO, "New Product written to db cat " + product.getId());

	}

	// retreive information from the db and get products
	public ArrayList<Product> DisplayCatalog() throws SQLException {
		ArrayList<Product> products = new ArrayList<>();
		ProductFactory fact = new ProductFactory();
		try (Statement statement = con.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * FROM cat")) {
			while (resultSet.next()) {
				String name = resultSet.getString("name");
				String id = resultSet.getString("id");
				String price = resultSet.getString("price");
				String type = resultSet.getString("type");
				products.add(fact.createProduct(name, id, price, type));
			}
		}
		return products;
	}

}
