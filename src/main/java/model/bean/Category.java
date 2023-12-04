package model.bean;

public class Category {
	private String ID;
	private String Name;
	public Category(String iD, String name) {
		super();
		ID = iD;
		Name = name;
	}
	public Category() {
		super();
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	
}
