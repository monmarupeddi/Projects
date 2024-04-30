package FinalProject;

//currently has only one type. But extendable without modification.
public class ProductFactory {
	public Product createProduct(String name,String id,String price,String type) {
        switch (type) {
            case "pets":
                return new PetProducts(name, id, price, type);
           
            default:
                throw new IllegalArgumentException("Invalid product type: " + type);
        }
    }

	
}
