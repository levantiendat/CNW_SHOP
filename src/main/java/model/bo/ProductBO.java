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
}
