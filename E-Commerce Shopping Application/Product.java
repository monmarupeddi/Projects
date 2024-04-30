package FinalProject;

public interface Product {
	String getName();
	String getPrice();
	String getId();
	String getType();
}

//Only one type of product is added. i.e. pet products. But it can be extended to as many. Implements Product interface.
class PetProducts implements Product {
	
	private String id;
	private String name;
	private String price;
	private String type;
	public PetProducts( String name,String id, String price, String type) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return type;
	}
	
	
	
	
}
