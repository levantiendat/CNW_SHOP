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
}
