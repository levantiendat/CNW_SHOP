package model.bo;

import java.util.ArrayList;

import model.bean.Product;
import model.dao.ProductDAO;

public class ProductBO {
	public ArrayList<Product> getAllProduct(){
		ProductDAO dao = new ProductDAO();
		return dao.getAllProduct();
	}
	public ArrayList<Product> getProductByCategory(String category){
		ProductDAO dao = new ProductDAO();
		return dao.getProductByCategory(category);
	}
	public Product getProduct(String ID) {
		ProductDAO dao = new ProductDAO();
		return dao.getProduct(ID);
	}
	public boolean UpdateProduct(String ID, String ID_Category, String Name, int Price, int Promotion) {
		ProductDAO dao = new ProductDAO();
		return dao.UpdateProduct(ID, ID_Category, Name, Price, Promotion);
	}
	public boolean AddProduct(String ID, String ID_Category, String Name, int Price, int Promotion) {
		ProductDAO dao = new ProductDAO();
		return dao.AddProduct(ID, ID_Category, Name, Price, Promotion);
	}
	public ArrayList<String> GetAllProductID(){
		ProductDAO dao = new ProductDAO();
		return dao.GetAllProductID();
	}
	public boolean DeleteProduct(String ID) {
		ProductDAO dao = new ProductDAO();
		return dao.DeleteProduct(ID);
	}
	public ArrayList<Product> SearchProductByName(String Name){
		ProductDAO dao = new ProductDAO();
		return dao.SearchProductByName(Name);
	}
	public ArrayList<Product> SearchProductByPrice(int Price){
		ProductDAO dao = new ProductDAO();
		return dao.SearchProductByPrice(Price);
	}
}
