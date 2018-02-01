package pojo;

public class Transaction {
	private int tsid;
	private long bookingdate;
	private int seatno;
	private Passanger passanger;
	private FlightSchedule flightschedule;
	private int type;
	private User user;
	private Offer offer;
	private double total;
	private String creditcard;
	private int wheelchair;
	private String food;
	private int cabinclass;

	public Transaction(int tsid, long bookingdate, int seatno, Passanger passanger, FlightSchedule flightschedule,
			int type, User user, Offer offer, double total, String creditcard, int wheelchair, String food,
			int cabinclass) {
		this.tsid = tsid;
		this.bookingdate = bookingdate;
		this.seatno = seatno;
		this.passanger = passanger;
		this.flightschedule = flightschedule;
		this.type = type;
		this.user = user;
		this.offer = offer;
		this.total = total;
		this.creditcard = creditcard;
		this.wheelchair = wheelchair;
		this.food = food;
		this.cabinclass = cabinclass;
	}

	public Transaction() {
	}

	public Transaction(long d, int seatno, Passanger p) {
		this.bookingdate = d;
		this.seatno = seatno;
		this.passanger = p;

	}

	public int getTsid() {
		return tsid;
	}

	public void setTsid(int tsid) {
		this.tsid = tsid;
	}

	public long getBookingdate() {
		return bookingdate;
	}

	public void setBookingdate(long bookingdate) {
		this.bookingdate = bookingdate;
	}

	public int getSeatno() {
		return seatno;
	}

	public void setSeatno(int seatno) {
		this.seatno = seatno;
	}

	public Passanger getPassanger() {
		return passanger;
	}

	public void setPassanger(Passanger passanger) {
		this.passanger = passanger;
	}

	public FlightSchedule getFlightschedule() {
		return flightschedule;
	}

	public void setFlightschedule(FlightSchedule flightschedule) {
		this.flightschedule = flightschedule;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Offer getOffer() {
		return offer;
	}

	public void setOffer(Offer offer) {
		this.offer = offer;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getCreditcard() {
		return creditcard;
	}

	public void setCreditcard(String creditcard) {
		this.creditcard = creditcard;
	}

	public int getWheelchair() {
		return wheelchair;
	}

	public void setWheelchair(int wheelchair) {
		this.wheelchair = wheelchair;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public int getCabinclass() {
		return cabinclass;
	}

	public void setCabinclass(int cabinclass) {
		this.cabinclass = cabinclass;
	}

	public String toString() {
		return "Transaction [tsid=" + tsid + ", bookingdate=" + bookingdate + ", seatno=" + seatno + ", passanger="
				+ passanger + ", flightschedule=" + flightschedule + ", type=" + type + ", user=" + user + ", offer="
				+ offer + ", total=" + total + ", creditcard=" + creditcard + ", wheelchair=" + wheelchair + ", food="
				+ food + ", cabinclass=" + cabinclass + "]";
	}

}
