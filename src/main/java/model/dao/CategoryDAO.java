package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;

public class CategoryDAO {
	public ArrayList<Category> getCategoryList(){
		try {
			ArrayList<Category> list = new ArrayList<Category>();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM category");
	        ResultSet res=stmt.executeQuery(query);

	        while(res.next()){
	        	Category category = new Category();
	        	category.setID(res.getString("ID"));
	        	category.setName(res.getString("Name"));
	        	list.add(category);
	        }
	        res.close();
            stmt.close();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	public ArrayList<String> GetAllCategoryName(){
		try {
			ArrayList<String> list = new ArrayList<String>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT Name FROM category");
	        ResultSet res=stmt.executeQuery(query);
	        while(res.next()) {
	        	list.add(res.getString("Name"));
	        }
	        return list;
		}
		catch (Exception e) {
			System.out.print(e.getLocalizedMessage());
			return null;
		}
		
	}
	public Boolean addCategory(String ID, String Name) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query = String.format("INSERT INTO `category` (`ID`, `Name`) VALUES ('%s', '%s')", ID, Name);
			stmt.executeUpdate(query);
			return true;
		} catch(Exception e) {
			e.getStackTrace();
			return false;
		}
	}
	public Boolean updateCategory(String ID, String Name) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query = String.format("UPDATE `category` SET `Name` = '%s' WHERE ID = '%s'", Name, ID);
			stmt.executeUpdate(query);
			return true;
		} catch(Exception e) {
			e.getStackTrace();
			return false;
		}
	}
	public Boolean deleteCategory(String ID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query = String.format("DELETE FROM category WHERE `ID` = '%s'", ID);
			stmt.executeUpdate(query);
			return true;
		} catch(Exception e) {
			e.getStackTrace();
			return false;
		}
	}
	public Category getCategory(String ID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM category where ID='%s'", ID);
	        ResultSet res=stmt.executeQuery(query);
	        Category category = new Category();
	        if(res.next()){	        	
	        	category.setID(res.getString("ID"));
	        	category.setName(res.getString("Name"));	
	        }
	        res.close();
            stmt.close();
			return category;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
