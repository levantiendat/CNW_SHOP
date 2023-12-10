package model.bo;

import java.util.ArrayList;

import model.bean.Account;
import model.dao.AccountDAO;

public class AccountBO {
	public Boolean SignupAccount(Account account) {
		AccountDAO dao = new AccountDAO();
		return dao.SignupAccount(account);
	}
	public Account SinginAccount(String username, String password) {
		AccountDAO dao = new AccountDAO();
		return dao.SigninAccount(username, password);
	}
	public Account GetAccountByUserName(String Username) {
		AccountDAO dao = new AccountDAO();
		return dao.GetAccountByUserName(Username);
	}
	public ArrayList<String> GetAllUsername(){
		AccountDAO dao = new AccountDAO();
		return dao.GetAllUsername();
	}
	public ArrayList<String> GetAllGmail(){
		AccountDAO dao = new AccountDAO();
		return dao.GetAllGmail();
	}
	public boolean UpdateAccount(String username, String name, String gmail) {
		AccountDAO dao = new AccountDAO();
		return dao.UpdateAccount(username, name, gmail);
	}
	public ArrayList<Account> getAllUser(){
		AccountDAO dao = new AccountDAO();
		return dao.getAllUser();
	}
	public ArrayList<Account> SearchUserByUserName(String username){
		AccountDAO dao = new AccountDAO();
		return dao.SearchUserByUserName(username);
	}
	public ArrayList<Account> SearchUserByName(String name){
		AccountDAO dao = new AccountDAO();
		return dao.SearchUserByName(name);
	}
}
