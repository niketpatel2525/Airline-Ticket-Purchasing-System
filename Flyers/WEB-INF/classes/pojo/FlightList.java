package pojo;

import java.util.LinkedList;
import java.util.List;

public class FlightList {
	LinkedList<Flight> flights = new LinkedList<Flight>();
	double fareeconomy;
	double farefirst;
	double farebusiness;
	double cancellationCharge;
	int bagallow;
	double extrabag;
	Aircraft aircraftid;
	Airline airline;

	public FlightList(Flight flight, double fareeconomy, double farefirst, double farebusiness,
			double cancellationCharge, int bagallow, double extrabag, Aircraft aircraftid, Airline airline) {

		this.flights.add(flight);
		this.fareeconomy = fareeconomy;
		this.farefirst = farefirst;
		this.farebusiness = farebusiness;
		this.cancellationCharge = cancellationCharge;
		this.bagallow = bagallow;
		this.extrabag = extrabag;
		this.aircraftid = aircraftid;
		this.airline = airline;
	}

	public FlightList() {

	}

	public FlightList(Flight flight1, Flight flight2, double fareeconomy, double farefirst, double farebusiness,
			double cancellationCharge, int bagallow, double extrabag, Aircraft aircraftid, Airline airline) {
		this.flights.add(flight1);
		this.flights.add(flight2);
		this.fareeconomy = fareeconomy;
		this.farefirst = farefirst;
		this.farebusiness = farebusiness;
		this.cancellationCharge = cancellationCharge;
		this.bagallow = bagallow;
		this.extrabag = extrabag;
		this.aircraftid = aircraftid;
		this.airline = airline;

	}

	public FlightList(Flight flight1, Flight flight2,Flight flight3,Flight flight4, double fareeconomy, double farefirst, double farebusiness,
			double cancellationCharge, int bagallow, double extrabag, Aircraft aircraftid, Airline airline) {
		this.flights.add(flight1);
		this.flights.add(flight2);
		this.flights.add(flight3);
		this.flights.add(flight4);
		this.fareeconomy = fareeconomy;
		this.farefirst = farefirst;
		this.farebusiness = farebusiness;
		this.cancellationCharge = cancellationCharge;
		this.bagallow = bagallow;
		this.extrabag = extrabag;
		this.aircraftid = aircraftid;
		this.airline = airline;

	}
	
	public LinkedList<Flight> getFlights() {
		return flights;
	}

	public void setFlights(LinkedList<Flight> flights) {
		this.flights = flights;
	}

	public double getFareeconomy() {
		return fareeconomy;
	}

	public void setFareeconomy(double fareeconomy) {
		this.fareeconomy = fareeconomy;
	}

	public double getFarefirst() {
		return farefirst;
	}

	public void setFarefirst(double farefirst) {
		this.farefirst = farefirst;
	}

	public double getFarebusiness() {
		return farebusiness;
	}

	public void setFarebusiness(double farebusiness) {
		this.farebusiness = farebusiness;
	}

	public double getCancellationCharge() {
		return cancellationCharge;
	}

	public void setCancellationCharge(double cancellationCharge) {
		this.cancellationCharge = cancellationCharge;
	}

	public int getBagallow() {
		return bagallow;
	}

	public void setBagallow(int bagallow) {
		this.bagallow = bagallow;
	}

	public double getExtrabag() {
		return extrabag;
	}

	public void setExtrabag(double extrabag) {
		this.extrabag = extrabag;
	}

	public Aircraft getAircraftid() {
		return aircraftid;
	}

	public void setAircraftid(Aircraft aircraftid) {
		this.aircraftid = aircraftid;
	}

	public Airline getAirline() {
		return airline;
	}

	public void setAirline(Airline airline) {
		this.airline = airline;
	}

	public String toString() {
		return "FlightList [flights=" + flights + ", fareeconomy=" + fareeconomy + ", farefirst=" + farefirst
				+ ", farebusiness=" + farebusiness + ", cancellationCharge=" + cancellationCharge + ", bagallow="
				+ bagallow + ", extrabag=" + extrabag + ", aircraftid=" + aircraftid + ", airline=" + airline + "]";
	}

}
