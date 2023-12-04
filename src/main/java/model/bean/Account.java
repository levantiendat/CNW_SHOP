package model.bean;

public class Account {
	private String Username;
	private String Password;
	private String Name;
	private String Email;
	private int Roles; //Roles = 1 is admin, Roles = 0 is customer
	public Account(String username, String password, String name, String email, int roles) {
		super();
		Username = username;
		Password = password;
		Name = name;
		Email = email;
		Roles = roles;
	}
	public Account() {
		super();
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getRoles() {
		return Roles;
	}
	public void setRoles(int roles) {
		Roles = roles;
	}
	
}
