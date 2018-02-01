package pojo;

public class Airline {
	private User user;
	private String airlinename;
	private String image;
	private String description;

	public Airline(User user, String airlinename, String image, String description) {
		this.user = user;
		this.airlinename = airlinename;
		this.image = image;
		this.description = description;
	}

	public Airline() {

	}

	public Airline(User user) {
		this.user = user;
	}

	public Airline(String username, String airlinename) {
		this.user = new User(username);
		this.airlinename = airlinename;
	}

	public Airline(String airlinename, String image, String description) {
		this.airlinename = airlinename;
		this.image = image;
		this.description = description;
	}

	public User getUsername() {
		return user;
	}

	public void setUsername(User user) {
		this.user = user;
	}

	public String getAirlinename() {
		return airlinename;
	}

	public void setAirlinename(String airlinename) {
		this.airlinename = airlinename;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String toString() {
		return "Airline [user=" + user + ", airlinename=" + airlinename + ", image=" + image + ", description="
				+ description + "]";
	}

}
