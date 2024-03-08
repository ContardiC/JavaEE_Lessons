package spacecoding.it.bean;

public class LoginBean {
	private String userName;
	private String password;
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isValidUser() {
		return this.userName.equals("admin") && this.password.equals("admin");
	}
}
