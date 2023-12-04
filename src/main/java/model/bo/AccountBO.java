package model.bo;

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
}
