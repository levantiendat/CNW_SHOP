package model.bo;

import java.util.ArrayList;

import model.bean.Cart;
import model.dao.CartDAO;

public class CartBO {
	public Boolean addToCart(String username, String ID) {
		CartDAO dao = new CartDAO();
		return dao.addToCart(username, ID);
	}
	public ArrayList<Cart> showCart(String username){
		CartDAO dao = new CartDAO();
		return dao.showCart(username);
	}
	public Cart getCart(String username, String ProductID) {
		CartDAO dao = new CartDAO();
		return dao.getCart(username, ProductID);
	}
	public void UpdateCart(String username, String ProductID, int number) {
		CartDAO dao = new CartDAO();
		dao.UpdateCart(username, ProductID, number);
	}
	public void DeleteCart(String username, String ProductID) {
		CartDAO dao = new CartDAO();
		dao.DeleteCart(username, ProductID);
	}
	public boolean DeleteCartByUsername(String Username) {
		CartDAO dao = new CartDAO();
		return dao.DeleteCartByUsername(Username);
	}
}
