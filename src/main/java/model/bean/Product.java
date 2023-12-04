package model.bean;

public class Product {
	private String ID;
	private String ID_Category;
	private String Name;
	private int Price;
	private int Promotion;
	public Product() {
		super();
	}
	public Product(String iD, String iD_Category, String name, int price, int promotion) {
		super();
		ID = iD;
		ID_Category = iD_Category;
		Name = name;
		Price = price;
		Promotion = promotion;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getID_Category() {
		return ID_Category;
	}
	public void setID_Category(String iD_Category) {
		ID_Category = iD_Category;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getPromotion() {
		return Promotion;
	}
	public void setPromotion(int promotion) {
		Promotion = promotion;
	}
	
}
