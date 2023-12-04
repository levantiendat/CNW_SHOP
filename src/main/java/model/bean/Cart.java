package model.bean;

public class Cart extends Product {
	
	private String Username;
	private int number;
	
	public Cart() {
		super();
	}
	

	public Cart(String iD, String iD_Category, String name, int price, int promotion, String username, int number) {
		super(iD, iD_Category, name, price, promotion);
		Username = username;
		this.number = number;
	}


	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
