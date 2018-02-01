package pojo;

public class DailySale {
	long date;
	double totalsale;
	int totaltickets;

	public DailySale(long date, double totalsale, int totaltickets) {
		this.date = date;
		this.totalsale = totalsale;
		this.totaltickets = totaltickets;
	}

	public long getDate() {
		return date;
	}

	public void setDate(long date) {
		this.date = date;
	}

	public double getTotalsale() {
		return totalsale;
	}

	public void setTotalsale(double totalsale) {
		this.totalsale = totalsale;
	}

	public int getTotaltickets() {
		return totaltickets;
	}

	public void setTotaltickets(int totaltickets) {
		this.totaltickets = totaltickets;
	}
}
