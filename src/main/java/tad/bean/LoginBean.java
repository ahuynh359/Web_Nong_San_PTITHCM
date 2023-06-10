package tad.bean;

public class LoginBean {

	public LoginBean() {
		this.username = "";
		this.password = "";
	}

	public LoginBean(String username, String password) {
		this.username = username;
		this.password = password;
	}

	private String username;
	private String password;
	private boolean isRemember;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getIsRemember() {
		return isRemember;
	}

	public void setIsRemember(boolean isRemember) {
		this.isRemember = isRemember;
	}

}
