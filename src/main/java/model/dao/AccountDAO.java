package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.bean.Account;

public class AccountDAO {
	public Boolean SignupAccount(Account account) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query = String.format("INSERT INTO `account` (`Username`, `Password`, `Name`, `Email`, `Role`) VALUES ('%s', '%s', '%s', '%s', '%d');", account.getUsername(), account.getPassword(),
					account.getName(), account.getEmail(), account.getRoles());
            stmt.executeUpdate(query);
            stmt.close();
            return true;
			
		} catch(Exception e) {
			System.out.println(1);
			e.printStackTrace();
			return false;
		}
	}
	public Account SigninAccount(String username, String password) {
		
		try {
			Account account = new Account();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM account WHERE Username = '%s' AND Password = '%s'",username, password);
	        ResultSet res=stmt.executeQuery(query);

	        if(res.next()){
	        	account.setUsername(res.getString("Username"));
	        	account.setPassword(res.getString("Password"));
	        	account.setName(res.getString("Name"));
	        	account.setEmail(res.getString("Email"));
	        	account.setRoles(res.getInt("Role"));
	            

	            res.close();
	            stmt.close();
	            return account;
	        }
	        else{
	            res.close();
	            stmt.close();
	            return null;
	        }
		} catch(Exception e) {
			return null;
		}
		
	}
}
