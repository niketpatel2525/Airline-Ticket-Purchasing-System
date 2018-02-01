package pojo;

public class Aircraft {
	private int aircraftid;
	private String model;
	private int capacity;

	public Aircraft() {
	}

	public Aircraft(int aircraftid, String model, int capacity) {
		this.aircraftid = aircraftid;
		this.model = model;
		this.capacity = capacity;
	}

	public Aircraft(int aircraftid) {
		this.aircraftid = aircraftid;
	}

	public int getAircraftid() {
		return aircraftid;
	}

	public void setAircraftid(int aircraftid) {
		this.aircraftid = aircraftid;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String toString() {
		return "Aircraft [aircraftid=" + aircraftid + ", model=" + model + ", capacity=" + capacity + "]";
	}

}
