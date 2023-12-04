package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Product;

public class ProductDAO {
	public ArrayList<Product> getAllProduct(){
		try {
			ArrayList<Product> list = new ArrayList<Product>();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM product");
	        ResultSet res=stmt.executeQuery(query);

	        while(res.next()){
	        	Product product = new Product();
	        	product.setID(res.getString("ID"));
	        	product.setID_Category(res.getString("ID_Category"));
	        	product.setName(res.getString("Name"));
	        	product.setPrice(res.getInt("Price"));
	        	product.setPromotion(res.getInt("Promotion"));
	        	list.add(product);
	        }
	        res.close();
            stmt.close();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	public ArrayList<Product> getProductByCategory(String category){
		try {
			ArrayList<Product> list = new ArrayList<Product>();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM product where ID_Category = '%s'", category);
	        ResultSet res=stmt.executeQuery(query);

	        while(res.next()){
	        	Product product = new Product();
	        	product.setID(res.getString("ID"));
	        	product.setID_Category(res.getString("ID_Category"));
	        	product.setName(res.getString("Name"));
	        	product.setPrice(res.getInt("Price"));
	        	product.setPromotion(res.getInt("Promotion"));
	        	list.add(product);
	        }
	        res.close();
            stmt.close();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	public Product getProduct(String ID) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM product where ID = '%s'", ID);
	        ResultSet res=stmt.executeQuery(query);
	        Product product = new Product();
	        if(res.next()){
	        	product.setID(res.getString("ID"));
	        	product.setID_Category(res.getString("ID_Category"));
	        	product.setName(res.getString("Name"));
	        	product.setPrice(res.getInt("Price"));
	        	product.setPromotion(res.getInt("Promotion"));
	        }
	        res.close();
            stmt.close();
			return product;
		} catch (Exception e) {
			return null;
		}
	}
}
