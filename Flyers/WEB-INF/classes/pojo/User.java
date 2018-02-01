package pojo;

public class User {
	private String username;
	private String password;
	private long datecreated;
	private int usertype;
	private String fname;
	private String lname;
	private String saddr;
	private String city;
	private String state;
	private long lastlogin;
	private double balance;

	public User() {
	}

	public User(String username, String password, long datecreated, int usertype, String fname, String lname,
			String saddr, String city, String state, long lastlogin, double balance) {
		this.username = username;
		this.password = password;
		this.datecreated = datecreated;
		this.usertype = usertype;
		this.fname = fname;
		this.lname = lname;
		this.saddr = saddr;
		this.city = city;
		this.state = state;
		this.lastlogin = lastlogin;
		this.balance = balance;
	}

	public User(String username) {
		this.setUsername(username);
	}

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

	public long getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(long datecreated) {
		this.datecreated = datecreated;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getSaddr() {
		return saddr;
	}

	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public long getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(long lastlogin) {
		this.lastlogin = lastlogin;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String toString() {
		return "User [username=" + username + ", password=" + password + ", datecreated=" + datecreated + ", usertype="
				+ usertype + ", fname=" + fname + ", lname=" + lname + ", saddr=" + saddr + ", city=" + city
				+ ", state=" + state + ", lastlogin=" + lastlogin + ", balance=" + balance + "]";
	}

}
