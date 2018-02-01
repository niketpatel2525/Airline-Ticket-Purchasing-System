package pojo;

public class Sales {
	private String airlinename;
	private int flightid;
	private int ticketsold;
	private double revenue;
	private String flight;

	public Sales(String airlinename, int flightid, int ticketsold, double revenue, String flight) {
		this.airlinename = airlinename;
		this.flightid = flightid;
		this.ticketsold = ticketsold;
		this.revenue = revenue;
		this.flight = flight;
	}

	public String getFlight() {
		return flight;
	}

	public void setFlight(String flight) {
		this.flight = flight;
	}

	public String getAirlinename() {
		return airlinename;
	}

	public void setAirlinename(String airlinename) {
		this.airlinename = airlinename;
	}

	public int getFlightid() {
		return flightid;
	}

	public void setFlightid(int flightid) {
		this.flightid = flightid;
	}

	public int getTicketsold() {
		return ticketsold;
	}

	public void setTicketsold(int ticketsold) {
		this.ticketsold = ticketsold;
	}

	public double getRevenue() {
		return revenue;
	}

	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}

	public String toString() {
		return "Sales [airlinename=" + airlinename + ", flightid=" + flightid + ", ticketsold=" + ticketsold
				+ ", revenue=" + revenue + ", flight=" + flight + "]";
	}

}
