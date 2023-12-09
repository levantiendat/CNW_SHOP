package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.fabric.xmlrpc.base.Array;

import model.bean.Account;

public class AccountDAO {
	public Connection GetCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			return con;
		}
		catch (Exception e) {
			return null;
		}
		
	}
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
	public ArrayList<String> GetAllGmail(){
		ArrayList<String> gmailList = null;
		try {
			Connection con = GetCon();
			if(con != null) {
				gmailList = new ArrayList<String>();
				Statement stm = con.createStatement();
				String query = "SELECT Email FROM Account";
				ResultSet rs = stm.executeQuery(query);
				while(rs.next()) {
					String Username = rs.getString("Email");
					gmailList.add(Username);
				}
				stm.close();
				con.close();
			}
			return gmailList;
		}
		catch (Exception e) {
			return null;
		}
	}
	public ArrayList<String> GetAllUsername(){
		ArrayList<String> usernameList = null;
		try {
			Connection con = GetCon();
			if(con != null) {
				usernameList = new ArrayList<String>();
				Statement stm = con.createStatement();
				String query = "SELECT username FROM Account";
				ResultSet rs = stm.executeQuery(query);
				while(rs.next()) {
					String Username = rs.getString("username");
					usernameList.add(Username);
				}
				stm.close();
				con.close();
			}
			return usernameList;
		}
		catch (Exception e) {
			return null;
		}
	}
	public boolean UpdateAccount(String username, String name, String gmail) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query = String.format("Update account Set Name = '%s', Email = '%s' where Username = '%s'", name, gmail, username);
			int res = stmt.executeUpdate(query);
			stmt.close();
			con.close();
			if(res > 0) {
				return true;
			}
			return false;
		} catch(Exception e) {
			System.out.print(e.getLocalizedMessage());
			return false;
		}
	}
	public Account GetAccountByUserName(String Username) {
		try {
			Account account = new Account();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM account WHERE Username = '%s'",Username);
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
	public ArrayList<Account> getAllUser(){
		try {
			ArrayList<Account> list = new ArrayList<Account>();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM account");
	        ResultSet res=stmt.executeQuery(query);

	        while(res.next()){
	        	Account account = new Account();
	        	account.setUsername(res.getString("Username"));
	        	account.setPassword(res.getString("Password"));
	        	account.setName(res.getString("Name"));
	        	account.setEmail(res.getString("Email"));
	        	account.setRoles(res.getInt("Role"));
	            
	            list.add(account);
	        }
	    
	        res.close();
            stmt.close();
            return list;
		} catch(Exception e) {
			return null;
		}
	}
}
