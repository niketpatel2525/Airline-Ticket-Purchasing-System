package pojo;

public class FlightSchedule {
	private int fsid;
	private long flightdate;
	private long arrivaldate;
	private double fareeconomy;
	private double farebusiness;
	private double farefirst;
	private Aircraft aircraft;
	private Route route;
	private int bagallow;
	private double extrabagfare;
	private int timeoffset;
	private Airline airline;
	private int wifi;
	private double cancellationcharge;
	private long estimatedFlightDate;
	private long estimatedArrivalDate;

	public FlightSchedule(long flightdate, long arrivaldate, int timeoffset, long estimatedFlightDate,
			long estimatedArrivalDate) {
		this.flightdate = flightdate;
		this.arrivaldate = arrivaldate;
		this.timeoffset = timeoffset;
		this.estimatedFlightDate = estimatedFlightDate;
		this.estimatedArrivalDate = estimatedArrivalDate;
	}

	public FlightSchedule(long flightdate, long arrivaldate, double fareeconomy, double farebusiness, double farefirst,
			Aircraft aircraft, Route route, int bagallow, double extrabagfare, int timeoffset, Airline airline,
			int wifi, double cancellationcharge) {
		this.flightdate = flightdate;
		this.arrivaldate = arrivaldate;
		this.fareeconomy = fareeconomy;
		this.farebusiness = farebusiness;
		this.farefirst = farefirst;
		this.aircraft = aircraft;
		this.route = route;
		this.bagallow = bagallow;
		this.extrabagfare = extrabagfare;
		this.timeoffset = timeoffset;
		this.airline = airline;
		this.wifi = wifi;
		this.cancellationcharge = cancellationcharge;
	}

	public FlightSchedule(int fsid, long flightdate, long arrivaldate, double fareeconomy, double farebusiness,
			double farefirst, Aircraft aircraft, Route route, int bagallow, double extrabagfare, int timeoffset,
			Airline airline, int wifi, double cancellationcharge) {

		this.fsid = fsid;
		this.flightdate = flightdate;
		this.arrivaldate = arrivaldate;
		this.fareeconomy = fareeconomy;
		this.farebusiness = farebusiness;
		this.farefirst = farefirst;
		this.aircraft = aircraft;
		this.route = route;
		this.bagallow = bagallow;
		this.extrabagfare = extrabagfare;
		this.timeoffset = timeoffset;
		this.airline = airline;
		this.wifi = wifi;
		this.cancellationcharge = cancellationcharge;
	}

	public FlightSchedule() {

	}

	public FlightSchedule(long flightdate, long arrivaldate, double fareeconomy, double farebusiness, double farefirst,
			int aircraftid, int routeid, int bagallow, double extrabag, int timeoffset, Airline airline, int wifi,
			double cancellationcharge) {

		this.flightdate = flightdate;
		this.arrivaldate = arrivaldate;
		this.fareeconomy = fareeconomy;
		this.farebusiness = farebusiness;
		this.farefirst = farefirst;

		this.aircraft = new Aircraft();
		this.aircraft.setAircraftid(aircraftid);

		this.route = new Route();
		this.route.setRouteid(routeid);

		this.bagallow = bagallow;
		this.extrabagfare = extrabagfare;
		this.timeoffset = timeoffset;
		this.airline = airline;
		this.wifi = wifi;
		this.cancellationcharge = cancellationcharge;
	}

	public FlightSchedule(int fsid, long flightdate, long arrivaldate, Aircraft aircraft, Route route, int bagallow,
			Airline airline, int wifi) {
		this.fsid = fsid;
		this.flightdate = flightdate;
		this.arrivaldate = arrivaldate;
		this.aircraft = aircraft;
		this.route = route;
		this.bagallow = bagallow;
		this.airline = airline;
		this.wifi = wifi;
	}

	public int getFsid() {
		return fsid;
	}

	public void setFsid(int fsid) {
		this.fsid = fsid;
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

	public double getFareeconomy() {
		return fareeconomy;
	}

	public void setFareeconomy(double fareeconomy) {
		this.fareeconomy = fareeconomy;
	}

	public double getFarebusiness() {
		return farebusiness;
	}

	public void setFarebusiness(double farebusiness) {
		this.farebusiness = farebusiness;
	}

	public double getFarefirst() {
		return farefirst;
	}

	public void setFarefirst(double farefirst) {
		this.farefirst = farefirst;
	}

	public Aircraft getAircraft() {
		return aircraft;
	}

	public void setAircraft(Aircraft aircraft) {
		this.aircraft = aircraft;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public int getBagallow() {
		return bagallow;
	}

	public void setBagallow(int bagallow) {
		this.bagallow = bagallow;
	}

	public double getExtrabagfare() {
		return extrabagfare;
	}

	public void setExtrabagfare(double extrabagfare) {
		this.extrabagfare = extrabagfare;
	}

	public int getTimeoffset() {
		return timeoffset;
	}

	public void setTimeoffset(int timeoffset) {
		this.timeoffset = timeoffset;
	}

	public Airline getUser() {
		return airline;
	}

	public void setUser(Airline airline) {
		this.airline = airline;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public double getCancellationcharge() {
		return cancellationcharge;
	}

	public void setCancellationcharge(double cancellationcharge) {
		this.cancellationcharge = cancellationcharge;
	}

	public Airline getAirline() {
		return airline;
	}

	public void setAirline(Airline airline) {
		this.airline = airline;
	}

	public long getEstimatedFlightDate() {
		return estimatedFlightDate;
	}

	public void setEstimatedFlightDate(long estimatedFlightDate) {
		this.estimatedFlightDate = estimatedFlightDate;
	}

	public long getEstimatedArrivalDate() {
		return estimatedArrivalDate;
	}

	public void setEstimatedArrivalDate(long estimatedArrivalDate) {
		this.estimatedArrivalDate = estimatedArrivalDate;
	}

	public String toString() {
		return "FlightSchedule [fsid=" + fsid + ", flightdate=" + flightdate + ", arrivaldate=" + arrivaldate
				+ ", fareeconomy=" + fareeconomy + ", farebusiness=" + farebusiness + ", farefirst=" + farefirst
				+ ", aircraft=" + aircraft + ", route=" + route + ", bagallow=" + bagallow + ", extrabagfare="
				+ extrabagfare + ", timeoffset=" + timeoffset + ", airline=" + airline + ", wifi=" + wifi
				+ ", cancellationcharge=" + cancellationcharge + "]";
	}

}
