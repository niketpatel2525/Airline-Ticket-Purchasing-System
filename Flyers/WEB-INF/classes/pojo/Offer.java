package pojo;

public class Offer {
	private int offersid;
	private String offername;
	private double discount;
	private double amount;
	private String description;
	private User user;
	private String promocode;
	private int active;

	public Offer(int offersid, String offername, double discount, double amount, String description, User user,
			String promocode, int active) {

		this.offersid = offersid;
		this.offername = offername;
		this.discount = discount;
		this.amount = amount;
		this.description = description;
		this.user = user;
		this.promocode = promocode;
		this.active = active;
	}

	public Offer() {

	}

	public Offer(int offersid, String promocode) {
		this.offersid = offersid;
		this.promocode = promocode;
	}

	public int getOffersid() {
		return offersid;
	}

	public void setOffersid(int offersid) {
		this.offersid = offersid;
	}

	public String getOffername() {
		return offername;
	}

	public void setOffername(String offername) {
		this.offername = offername;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPromocode() {
		return promocode;
	}

	public void setPromocode(String promocode) {
		this.promocode = promocode;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
