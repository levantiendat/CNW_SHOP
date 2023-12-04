package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Cart;
import model.bean.Product;

public class CartDAO {
	public Boolean addToCart(String username, String ID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM cart where Username ='%s' and ID_Product='%s'", username, ID);
	        ResultSet res=stmt.executeQuery(query);
	        int id = 0;
	        int number = 0;
	        while(res.next()){
	        	id = res.getInt("ID");
	        	number = res.getInt("Number");
	        }
	        res.close();
            
	        if(id > 0) {
	        	String query1 = String.format("UPDATE cart SET Number = %d WHERE ID = %d", number+1, id);
	        	stmt.executeUpdate(query1);
	            stmt.close();
	            return true;
	        } else {
	        	query=String.format("SELECT * FROM cart");
	        	id = 0;
	        	res = stmt.executeQuery(query);
	        	while(res.next()) {
	        		id = res.getInt("ID");
	        	}
	        	id++;
	        	query = String.format("INSERT INTO cart (`ID`, `Username`, `ID_Product`, `Number`) VALUES (%d, '%s', '%s', '1')", id, username, ID);
	        	stmt.executeUpdate(query);
	            stmt.close();
	            return true;
	        }
	        
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public ArrayList<Cart> showCart(String username){
		try {
			ArrayList<Cart> list = new ArrayList<Cart>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM cart where Username ='%s'", username);
	        ResultSet res=stmt.executeQuery(query);
	        
	        while(res.next()){
	        	Cart cart = new Cart();
	        	int number = res.getInt("Number");
	        	String ID = res.getString("ID_Product");
	        	ProductDAO dao = new ProductDAO();
	        	Product product = dao.getProduct(ID);
	        	cart.setID(product.getID());
	        	cart.setID_Category(product.getID_Category());
	        	cart.setName(product.getName());
	        	cart.setPrice(product.getPrice());
	        	cart.setPromotion(product.getPromotion());
	        	cart.setUsername(username);
	        	cart.setNumber(number);
	        	list.add(cart);
	        }
	        res.close();
	        stmt.close();
	        return list;
		}catch (Exception e) {
			return null;
		}
	}
	
	public Cart getCart(String username, String ProductID) {
		try {
			ArrayList<Cart> list = new ArrayList<Cart>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM cart where Username ='%s' and ID_Product='%s'", username, ProductID);
	        ResultSet res=stmt.executeQuery(query);
	        
	        Cart cart = new Cart();
	        if(res.next()){
	        	
	        	int number = res.getInt("Number");
	        	String ID = res.getString("ID_Product");
	        	ProductDAO dao = new ProductDAO();
	        	Product product = dao.getProduct(ID);
	        	cart.setID(product.getID());
	        	cart.setID_Category(product.getID_Category());
	        	cart.setName(product.getName());
	        	cart.setPrice(product.getPrice());
	        	cart.setPromotion(product.getPromotion());
	        	cart.setUsername(username);
	        	cart.setNumber(number);

	        }
	        res.close();
	        stmt.close();
	        
			return cart;
		} catch(Exception e) {
			return null;
		}
	}
	public void UpdateCart(String username, String ProductID, int number) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			if(number > 0) {
				String query=String.format("UPDATE cart SET Number = %d WHERE ID_Product = '%s' and Username = '%s'", number, ProductID, username);
		        stmt.executeUpdate(query);
			} else {
				String query=String.format("DELETE FROM cart WHERE ID_Product = '%s' and Username='%s'", ProductID, username);
		        stmt.executeUpdate(query);
			}
			
            stmt.close();

		} catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	public void DeleteCart(String username, String ProductID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			
			String query=String.format("DELETE FROM cart WHERE ID_Product = '%s' and Username='%s'", ProductID, username);
		    stmt.executeUpdate(query);
            stmt.close();

		} catch(Exception e) {
			e.printStackTrace();
			
		}
	}
}
