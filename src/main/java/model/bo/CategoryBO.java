package model.bo;

import java.util.ArrayList;

import model.bean.Category;
import model.bean.Product;
import model.dao.CartDAO;
import model.dao.CategoryDAO;
import model.dao.HistoryDAO;
import model.dao.ProductDAO;

public class CategoryBO {
	public ArrayList<Category> getCategoryList(){
		CategoryDAO dao = new CategoryDAO();
		return dao.getCategoryList();
	}
	public ArrayList<String> GetAllCategoryName(){
		CategoryDAO dao = new CategoryDAO();
		return dao.GetAllCategoryName();
	}
	public Boolean addCategory(String ID, String Name) {
		CategoryDAO dao = new CategoryDAO();
		return dao.addCategory(ID, Name);
	}
	public Category getCategory(String ID) {
		CategoryDAO dao = new CategoryDAO();
		return dao.getCategory(ID);
	}
	public Boolean updateCategory(String ID, String Name) {
		CategoryDAO dao = new CategoryDAO();
		return dao.updateCategory(ID, Name);
	}
	public Boolean deleteCategory(String ID) {
		ProductDAO proDAO = new ProductDAO();
		CartDAO cartDAO = new CartDAO();
		HistoryDAO hisDAO = new HistoryDAO();
		ArrayList<Product> listProduct = proDAO.getProductByCategory(ID);
		for(Product product:listProduct) {
			cartDAO.DeleteCart(product.getID());
			hisDAO.DeleteHistoryDetailByIDProduct(product.getID());
			proDAO.DeleteProduct(product.getID());
		}
		
		CategoryDAO dao = new CategoryDAO();
		return dao.deleteCategory(ID);
	}
}
