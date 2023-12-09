package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.bean.Cart;
import model.bean.History;
import model.bean.HistoryDetail;
import model.bean.Product;

public class HistoryDAO {
	public void AddToCharging(String username) {
		try {
			ArrayList<Cart> list = new ArrayList<Cart>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM cart where Username ='%s'", username);
	        ResultSet res=stmt.executeQuery(query);
	        int bill = 0;
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
	        	bill+=(cart.getPrice()+cart.getPromotion())*number;
	        }
	        res.close();
	        Date dateofbill = new Date(System.currentTimeMillis());
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = dateFormat.format(dateofbill);
	        String query1=String.format("SELECT * FROM history");
	        ResultSet res1=stmt.executeQuery(query1);
	        int id = 0;
	        while(res1.next()) {
	        	id = res1.getInt("ID");
	        }
	        res1.close();
	        //Thêm vào csdl history
	        String query2 = String.format("INSERT INTO history (`ID`, `Username`, `Date`, `Bill`) VALUES (%d, '%s', '%s', %d)",id+1,username, formattedDate, bill);
	        stmt.executeUpdate(query2);
	        //Thêm vào CSDL history_detail
	        String queryx = String.format("Select * from historydetail");
	        res1=stmt.executeQuery(queryx);
	        int id_his = 0;
	        while(res1.next()) {
	        	id_his = res1.getInt("ID");
	        }
	        res1.close();
	        for(Cart cart:list) {
	        	int price = (cart.getPrice()+cart.getPromotion())*cart.getNumber();
	        	String query3 = String.format("INSERT INTO `historydetail` (`ID`, `ID_History`, `ID_Product`, `Price`) VALUES (%d, %d, '%s', %d)", ++id_his, id+1,cart.getID(), price);
	        	stmt.executeUpdate(query3);
	        }
	        //Xóa trong data cũ
	        
	        String query4 = String.format("DELETE FROM cart WHERE Username='%s'", username);
	        stmt.executeUpdate(query4);
	        stmt.close();
	        
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<History> getList(String username){
		try {
			ArrayList<History> list = new ArrayList<History>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM history where Username ='%s'", username);
	        ResultSet res=stmt.executeQuery(query);
	        while(res.next()) {
	        	History history = new History();
	        	history.setID(res.getInt("ID"));
	        	history.setUsername(res.getString("Username"));
	        	history.setDateOfBill(res.getDate("Date"));
	        	history.setBill(res.getInt("Bill"));
	        	list.add(history);
	        }
	        res.close();
	        stmt.close();
	        return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<History> getAllList(){
		try {
			ArrayList<History> list = new ArrayList<History>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM history");
	        ResultSet res=stmt.executeQuery(query);
	        while(res.next()) {
	        	History history = new History();
	        	history.setID(res.getInt("ID"));
	        	history.setUsername(res.getString("Username"));
	        	history.setDateOfBill(res.getDate("Date"));
	        	history.setBill(res.getInt("Bill"));
	        	list.add(history);
	        }
	        res.close();
	        stmt.close();
	        return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<HistoryDetail> getHistoryDetail(int ID){
		try {
			ArrayList<HistoryDetail> list = new ArrayList<HistoryDetail>();
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt =con.createStatement();
			String query=String.format("SELECT * FROM historydetail where ID_History =%d", ID);
	        ResultSet res=stmt.executeQuery(query);
	        while(res.next()) {
	        	HistoryDetail history = new HistoryDetail();
	        	history.setID(res.getInt("ID"));
	        	history.setID_History(ID);
	        	history.setID_Product(res.getString("ID_Product"));
	        	history.setPrice(res.getInt("Price"));
	        	list.add(history);
	        }
	        res.close();
	        stmt.close();
	        return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean DeleteHistoryDetailByIDProduct (String IDProduct) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/kinhdoanh";
			Connection con=DriverManager.getConnection(url,"root","");
			Statement stmt = con.createStatement();
			String query = String.format("Delete from historydetail where ID_Product = '%s'", IDProduct);
			int res = stmt.executeUpdate(query);
			stmt.close();
			con.close();
			return true;
		}
		catch (Exception e) {
			System.out.print("Remove HistoryDetail failed, error: " + e.getLocalizedMessage());
			return false;
		}
	}
}
