package model.bean;

public class HistoryDetail {
	private int ID;
	private int ID_History;
	private String ID_Product;
	private int Price;
	public HistoryDetail() {
		super();
	}
	
	public HistoryDetail(int iD, int iD_History, String iD_Product, int price) {
		super();
		ID = iD;
		ID_History = iD_History;
		ID_Product = iD_Product;
		Price = price;
	}

	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getID_History() {
		return ID_History;
	}
	public void setID_History(int iD_History) {
		ID_History = iD_History;
	}
	public String getID_Product() {
		return ID_Product;
	}
	public void setID_Product(String iD_Product) {
		ID_Product = iD_Product;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	
}
