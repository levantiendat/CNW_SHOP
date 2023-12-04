package model.bo;

import java.util.ArrayList;

import model.bean.Category;
import model.dao.CategoryDAO;

public class CategoryBO {
	public ArrayList<Category> getCategoryList(){
		CategoryDAO dao = new CategoryDAO();
		return dao.getCategoryList();
	}
}
