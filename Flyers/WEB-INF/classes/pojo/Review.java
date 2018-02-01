package pojo;

public class Review {
	private String airline;
	private String name;
	private String fdate;
	private String route;
	private String country;
	private String review;
	private int rating;
	private long date;

	public long getDate() {
		return date;
	}

	public void setDate(long date) {
		this.date = date;
	}

	public Review() {

	}

	public Review(String airline, String name, String fdate, String route, String country, String review, int rating,
			long date) {

		this.airline = airline;
		this.name = name;
		this.fdate = fdate;
		this.route = route;
		this.country = country;
		this.review = review;
		this.rating = rating;
		this.date = date;
	}

	public Review(String airline, String name, String fdate, String route, String country, String review, int rating) {
		this.airline = airline;
		this.name = name;
		this.fdate = fdate;
		this.route = route;
		this.country = country;
		this.review = review;
		this.rating = rating;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

}
