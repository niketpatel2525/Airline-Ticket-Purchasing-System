package pojo;

public class Flight {
	int fsid;
	Route route;
	long flightdate;
	long arrivaldate;
	int timeoffset;
	int wifi;

	public Flight(int fsid, Route route, long flightdate, long arrivaldate, int timeoffset, int wifi) {
		this.fsid = fsid;
		this.route = route;
		this.flightdate = flightdate;
		this.arrivaldate = arrivaldate;
		this.timeoffset = timeoffset;
		this.wifi = wifi;
	}

	public Flight() {

	}

	public int getFsid() {
		return fsid;
	}

	public void setFsid(int fsid) {
		this.fsid = fsid;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public long getFlightdate() {
		return flightdate;
	}

	public void setFlightdate(long flightdate) {
		this.flightdate = flightdate;
	}

	public long getArrivaldate() {
		return arrivaldate;
	}

	public void setArrivaldate(long arrivaldate) {
		this.arrivaldate = arrivaldate;
	}

	public int getTimeoffset() {
		return timeoffset;
	}

	public void setTimeoffset(int timeoffset) {
		this.timeoffset = timeoffset;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public String toString() {
		return "Flight [fsid=" + fsid + ", route=" + route + ", flightdate=" + flightdate + ", arrivaldate="
				+ arrivaldate + ", timeoffset=" + timeoffset + ", wifi=" + wifi + "]";
	}

}
