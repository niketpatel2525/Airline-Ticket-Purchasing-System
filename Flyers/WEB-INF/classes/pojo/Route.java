package pojo;

public class Route {
	private int routeid;
	private String airport;
	private String destination;

	public Route(int routeid, String airport, String destination) {

		this.routeid = routeid;
		this.airport = airport;
		this.destination = destination;
	}

	public Route() {

	}

	public Route(int routeid) {
		this.routeid = routeid;
	}

	public int getRouteid() {
		return routeid;
	}

	public void setRouteid(int routeid) {
		this.routeid = routeid;
	}

	public String getAirport() {
		return airport;
	}

	public void setAirport(String airport) {
		this.airport = airport;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String toString() {
		return "Route [routeid=" + routeid + ", airport=" + airport + ", destination=" + destination + "]";
	}

}
