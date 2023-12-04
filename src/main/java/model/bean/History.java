package model.bean;

import java.sql.Date;

public class History {
	private int ID;
	private String Username;
	private Date DateOfBill;
	private int Bill;
	public History() {
		super();
	}
	public History(int iD, String username, Date dateOfBill, int bill) {
		super();
		ID = iD;
		Username = username;
		DateOfBill = dateOfBill;
		Bill = bill;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public Date getDateOfBill() {
		return DateOfBill;
	}
	public void setDateOfBill(Date dateOfBill) {
		DateOfBill = dateOfBill;
	}
	public int getBill() {
		return Bill;
	}
	public void setBill(int bill) {
		Bill = bill;
	}
	
	
}
