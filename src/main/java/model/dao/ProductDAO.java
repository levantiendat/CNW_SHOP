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
	public boolean AddProduct(String ID, String ID_Category, String Name, int Price, int Promotion) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt = con.createStatement();
			String query = String.format("Insert into product values ('%s', '%s', '%s', '%d','%d')",
					ID, ID_Category, Name, Price, Promotion);
			System.out.print("Name: " + Name);
			int res = stmt.executeUpdate(query);
			stmt.close();
			con.close();
			return true;
		}
		catch (Exception e) {
			System.out.print("Add product failed, error: " + e.getLocalizedMessage());
			return false;
		}
	}
	public boolean UpdateProduct(String ID, String ID_Category, String Name, int Price, int Promotion) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt = con.createStatement();
			String query = String.format("Update product Set ID_Category = '%s', Name = '%s', Price = '%d', Promotion = '%d'"
					+ " where ID = '%s'", ID_Category, Name, Price, Promotion, ID);
			int res = stmt.executeUpdate(query);
			return true;
		}
		catch (Exception e) {
			System.out.print("Update product failed, error: " + e.getLocalizedMessage());
			return false;
		}
		
	}
	public boolean DeleteProduct(String ID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt = con.createStatement();
			String query = String.format("Delete from product where ID = '%s'", ID);
			int res = stmt.executeUpdate(query);
			stmt.close();
			con.close();
			return true;
		}
		catch (Exception e) {
			System.out.print("Remove product failed, error: " + e.getLocalizedMessage());
			return false;
		}
		
	}
	public ArrayList<String> GetAllProductID(){
		try {
			ArrayList<String> list = new ArrayList<String>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt = con.createStatement();
			String query = "Select ID from product";
			ResultSet res = stmt.executeQuery(query);
			while(res.next()){
	        	list.add(res.getString("ID"));
	        }
			stmt.close();
            con.close();
			return list;
		}
		catch (Exception e) {
			return null;
		}
	}
	public ArrayList<Product> SearchProductByName(String Name){
		try {
			ArrayList<Product> list = new ArrayList<Product>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query = String.format("SELECT * FROM product WHERE Name LIKE '%%%s%%'", Name);
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
	public ArrayList<Product> SearchProductByPrice(int Price){
		try {
			ArrayList<Product> list = new ArrayList<Product>();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM product where Price = '%d'", Price);
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
}
