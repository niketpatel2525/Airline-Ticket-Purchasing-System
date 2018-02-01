package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.*;
import java.sql.Statement;
import pojo.*;

public class MySqlDataStoreUtilities {
	private Connection con = null;
	private String DRIVERS = "com.mysql.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/";
	private String db = "flyers?verifyServerCertificate=false&useSSL=true";
	private String USER = "root";
	private String PASSWORD = "root";
	private PreparedStatement ps = null;
	public static LinkedHashMap<Integer, LinkedList<FlightList>> allFlightList = new LinkedHashMap<Integer, LinkedList<FlightList>>();
	public static LinkedList<FlightList> allFlight = new LinkedList<FlightList>();

	public static LinkedHashMap<Integer, LinkedList<FlightList>> travelFlightList = new LinkedHashMap<Integer, LinkedList<FlightList>>();
	public static LinkedList<FlightList> allTravelFlights = new LinkedList<FlightList>();

	public static void loadPrimry() {
		allFlight = null;
		allFlightList = null;
		allFlight = new LinkedList<FlightList>();
		allFlightList = new LinkedHashMap<Integer, LinkedList<FlightList>>();
		MySqlDataStoreUtilities.allFlight.addAll(MySqlDataStoreUtilities.allTravelFlights);
		MySqlDataStoreUtilities.allFlightList.putAll(MySqlDataStoreUtilities.travelFlightList);
	}

	public static FlightList getFlightList(int flightid) {
		return allFlight.get(flightid);
	}

	public FlightSchedule getFlightSchedule(int id) {
		FlightSchedule fs = null;
		try {
			getConnection();
			String sql = "select * from flightschedule where fsid=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int fsid = rs.getInt(1);
				long flightdate = rs.getTimestamp(2).getTime();
				long arrivaldate = rs.getTime(3).getTime();
				double fareeconomy = rs.getDouble(4);
				double farebusiness = rs.getDouble(5);
				double farefirst = rs.getDouble(6);
				Aircraft aircraft = new Aircraft(rs.getInt(7));
				Route route = new Route(rs.getInt(8));
				int bagallow = rs.getInt(9);
				double extrabagfare = rs.getDouble(10);
				int timeoffset = rs.getInt(11);
				String usr = rs.getString(12);
				Airline airline = new Airline(new User(usr));
				int wifi = rs.getInt(13);
				double cancellationcharge = rs.getDouble(14);

				fs = new FlightSchedule(fsid, flightdate, arrivaldate, fareeconomy, farebusiness, farefirst, aircraft,
						route, bagallow, extrabagfare, timeoffset, airline, wifi, cancellationcharge);
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fs;
	}

	public int bookTicket(int tsid, long bookingdate, Passanger p, int fsid, int type, String username, double fare,
			String ccnum, int cabin, String promo) {
		int result = 0;
		try {
			getConnection();
			String sql = "call bookTicket(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			if (con == null) {
				result = Error.SQL_NOT_RUNNING;
				return result;
			}
			ps = con.prepareStatement(sql);
			ps.setInt(1, tsid);

			Timestamp t = new Timestamp(bookingdate);
			ps.setTimestamp(2, t);

			ps.setString(3, p.getName());
			ps.setString(4, p.getAddress());
			ps.setString(5, p.getGender());
			ps.setInt(6, p.getAge());
			ps.setString(7, p.getPassportno());
			ps.setString(8, p.getNationality());
			ps.setString(9, p.getContact());
			ps.setString(10, p.getFreqflyerno());
			ps.setInt(11, fsid);
			ps.setInt(12, type);
			ps.setString(13, username);
			ps.setDouble(14, fare);
			ps.setString(15, ccnum);
			ps.setInt(16, cabin);
			ps.setString(17, promo);
			boolean hasResult = ps.execute();
			result = Error.SUCCESS;
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public HashMap<Integer, LinkedList<FlightSchedule>> fundnMyAllNextFlights(String username) {
		HashMap<Integer, LinkedList<FlightSchedule>> flightsdata = new HashMap<Integer, LinkedList<FlightSchedule>>();
		LinkedList<FlightSchedule> flights = new LinkedList<FlightSchedule>();
		int returncode = 0;
		try {
			getConnection();
			if (con == null) {
				returncode = Error.SQL_NOT_RUNNING;
			}

			String sql = "call findNextFlightsForAirline(?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					int fsid = rs.getInt(1);
					long flightdate = rs.getTimestamp(2).getTime();
					long arrivaldate = rs.getTime(3).getTime();
					double fareeconomy = rs.getDouble(4);
					double farebusiness = rs.getDouble(5);
					double farefirst = rs.getDouble(6);
					Aircraft aircraft = new Aircraft(rs.getInt(7));
					Route route = new Route(rs.getInt(8));
					int bagallow = rs.getInt(9);
					double extrabag = rs.getDouble(10);
					int timeoffset = rs.getInt(11);
					String usr = rs.getString(12);
					Airline airline = new Airline(new User(usr));
					int wifi = rs.getInt(13);
					double cancellationcharge = rs.getDouble(14);

					String departure = rs.getString(16);
					String arrival = rs.getString(17);
					route.setAirport(departure);
					route.setDestination(arrival);
					FlightSchedule fs = null;
					fs = new FlightSchedule(fsid, flightdate, arrivaldate, fareeconomy, farebusiness, farefirst,
							aircraft, route, bagallow, extrabag, timeoffset, airline, wifi, cancellationcharge);
					flights.add(fs);
				}
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flights.size() > 0) {
			returncode = Error.SUCCESS;
		} else {
			returncode = Error.NO_DATA;
		}
		System.out.println(flights);
		flightsdata.put(returncode, flights);
		return flightsdata;
	}

	// fetch Flights Details

	public LinkedHashMap<Integer, LinkedList<FlightList>> getAllOneWayFlight(String src, String dst, String fromDate) {
		LinkedHashMap<Integer, LinkedList<FlightList>> directFlights = fetchDirectOneWayFlights(src, dst, fromDate);
		LinkedHashMap<Integer, LinkedList<FlightList>> connectedFlights = fetchConnectedOneWayFlights(src, dst,
				fromDate);
		allFlight = null;
		allFlightList = null;
		allFlight = new LinkedList<FlightList>();
		allFlightList = new LinkedHashMap<Integer, LinkedList<FlightList>>();
		int returncode = 0;

		for (Map.Entry<Integer, LinkedList<FlightList>> data : directFlights.entrySet()) {
			allFlight.addAll(data.getValue());
			returncode = data.getKey();
		}
		for (Map.Entry<Integer, LinkedList<FlightList>> data : connectedFlights.entrySet()) {
			allFlight.addAll(data.getValue());
			if (returncode != Error.SUCCESS) {
				returncode = data.getKey();
			}
		}
		allFlightList.put(returncode, allFlight);
		return allFlightList;
	}

	public LinkedHashMap<Integer, LinkedList<FlightList>> getAllReturnFlight(String src, String dst, String fromDate,
			String toDate) {
		LinkedHashMap<Integer, LinkedList<FlightList>> directFlights = fetchDirectReturnFlights(src, dst, fromDate,
				toDate);
		LinkedHashMap<Integer, LinkedList<FlightList>> connectedFlights = fetchConnectedReturnFlights(src, dst,
				fromDate, toDate);
		allFlight = null;
		allFlightList = null;
		allFlight = new LinkedList<FlightList>();
		allFlightList = new LinkedHashMap<Integer, LinkedList<FlightList>>();

		int returncode = 0;

		for (Map.Entry<Integer, LinkedList<FlightList>> data : directFlights.entrySet()) {
			allFlight.addAll(data.getValue());
			returncode = data.getKey();
		}
		for (Map.Entry<Integer, LinkedList<FlightList>> data : connectedFlights.entrySet()) {
			allFlight.addAll(data.getValue());
			if (returncode != Error.SUCCESS) {
				returncode = data.getKey();
			}
		}

		allFlightList.put(returncode, allFlight);
		return allFlightList;
	}

	public LinkedHashMap<Integer, LinkedList<FlightList>> fetchConnectedReturnFlights(String src, String dst,
			String fromDate, String toDate) {
		LinkedHashMap<Integer, LinkedList<FlightList>> result = new LinkedHashMap<Integer, LinkedList<FlightList>>();
		LinkedList<FlightList> flights = new LinkedList<FlightList>();
		int resultcode;

		FlightList fl = null;
		Flight flight1 = null;
		Route route1 = null;

		Flight flight2 = null;
		Route route2 = null;

		Flight flight3 = null;
		Route route3 = null;

		Flight flight4 = null;
		Route route4 = null;

		Aircraft aircraft = null;

		Airline airline = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
			}
			String sql = "call findConnectedReturnFlights(?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, src);
			ps.setString(2, dst);
			ps.setString(3, fromDate);
			ps.setString(4, toDate);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					fl = null;
					flight1 = null;
					flight2 = null;
					flight3 = null;
					flight4 = null;
					aircraft = null;
					route1 = null;
					route2 = null;
					route3 = null;
					route4 = null;

					int fsid = rs.getInt(1);
					int routeid = rs.getInt(2);
					String airport = rs.getString(3);
					long flightdate = rs.getTimestamp(4).getTime();

					String destination = rs.getString(5);
					long arrivaldate = rs.getTimestamp(6).getTime();

					int timeoffset = rs.getInt(7);
					int wifi = rs.getInt(8);
					double fareeconomy = rs.getDouble(9);
					double farefirst = rs.getDouble(10);
					double farebusiness = rs.getDouble(11);
					double cancellationcharge = rs.getDouble(12);
					int bagallow = rs.getInt(13);
					double extrabagfare = rs.getDouble(14);
					int aircraftid = rs.getInt(15);
					String username = rs.getString(16);
					String airlinename = rs.getString(17);

					int fsid2 = rs.getInt(18);
					int routeid2 = rs.getInt(19);
					String airport2 = rs.getString(20);
					long flightdate2 = rs.getTimestamp(21).getTime();
					String destination2 = rs.getString(22);
					long arrivaldate2 = rs.getTimestamp(23).getTime();
					int timeoffset2 = rs.getInt(24);
					int wifi2 = rs.getInt(25);

					int fsid3 = rs.getInt(26);
					int routeid3 = rs.getInt(27);
					String airport3 = rs.getString(28);
					long flightdate3 = rs.getTimestamp(29).getTime();
					String destination3 = rs.getString(30);
					long arrivaldate3 = rs.getTimestamp(31).getTime();
					int timeoffset3 = rs.getInt(32);
					int wifi3 = rs.getInt(33);

					int fsid4 = rs.getInt(34);
					int routeid4 = rs.getInt(35);
					String airport4 = rs.getString(36);
					long flightdate4 = rs.getTimestamp(37).getTime();
					String destination4 = rs.getString(38);
					long arrivaldate4 = rs.getTimestamp(39).getTime();
					int timeoffset4 = rs.getInt(40);
					int wifi4 = rs.getInt(41);

					route1 = new Route(routeid, airport, destination);
					flight1 = new Flight(fsid, route1, flightdate, arrivaldate, timeoffset, wifi);

					route2 = new Route(routeid2, airport2, destination2);
					flight2 = new Flight(fsid2, route2, flightdate2, arrivaldate2, timeoffset2, wifi2);

					route3 = new Route(routeid3, airport3, destination3);
					flight3 = new Flight(fsid3, route3, flightdate3, arrivaldate3, timeoffset3, wifi3);

					route4 = new Route(routeid4, airport4, destination4);
					flight4 = new Flight(fsid4, route2, flightdate4, arrivaldate4, timeoffset4, wifi4);

					aircraft = new Aircraft(aircraftid);

					airline = new Airline(username, airlinename);

					fl = new FlightList(flight1, flight2, flight3, flight4, fareeconomy, farefirst, farebusiness,
							cancellationcharge, bagallow, extrabagfare, aircraft, airline);

					flights.add(fl);
				}
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (flights.size() == 0) {
			resultcode = Error.NO_DATA;
		} else {
			resultcode = Error.SUCCESS;
		}
		result.put(resultcode, flights);
		System.out.println(result);
		return result;
	}

	public LinkedHashMap<Integer, LinkedList<FlightList>> fetchDirectReturnFlights(String src, String dst,
			String fromDate, String toDate) {
		LinkedHashMap<Integer, LinkedList<FlightList>> result = new LinkedHashMap<Integer, LinkedList<FlightList>>();
		LinkedList<FlightList> flights = new LinkedList<FlightList>();
		int resultcode;

		FlightList fl = null;
		Flight flight1 = null;
		Route route1 = null;

		Flight flight2 = null;
		Route route2 = null;

		Aircraft aircraft = null;

		Airline airline = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
			}
			String sql = "call findDirectReturnFlights(?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, src);
			ps.setString(2, dst);
			ps.setString(3, fromDate);
			ps.setString(4, toDate);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					fl = null;
					flight1 = null;
					flight2 = null;
					aircraft = null;
					route1 = null;
					route2 = null;

					int fsid = rs.getInt(1);
					int routeid = rs.getInt(2);
					String airport = rs.getString(3);
					long flightdate = rs.getTimestamp(4).getTime();

					String destination = rs.getString(5);
					long arrivaldate = rs.getTimestamp(6).getTime();

					int timeoffset = rs.getInt(7);
					int wifi = rs.getInt(8);
					double fareeconomy = rs.getDouble(9);
					double farefirst = rs.getDouble(10);
					double farebusiness = rs.getDouble(11);
					double cancellationcharge = rs.getDouble(12);
					int bagallow = rs.getInt(13);
					double extrabagfare = rs.getDouble(14);
					int aircraftid = rs.getInt(15);
					String username = rs.getString(16);
					String airlinename = rs.getString(17);

					int fsid2 = rs.getInt(18);
					int routeid2 = rs.getInt(19);
					String airport2 = rs.getString(20);
					long flightdate2 = rs.getTimestamp(21).getTime();

					String destination2 = rs.getString(22);
					long arrivaldate2 = rs.getTimestamp(23).getTime();

					int timeoffset2 = rs.getInt(24);
					int wifi2 = rs.getInt(25);

					route1 = new Route(routeid, airport, destination);
					flight1 = new Flight(fsid, route1, flightdate, arrivaldate, timeoffset, wifi);
					route2 = new Route(routeid2, airport2, destination2);
					flight2 = new Flight(fsid2, route2, flightdate2, arrivaldate2, timeoffset2, wifi2);
					aircraft = new Aircraft(aircraftid);

					airline = new Airline(username, airlinename);

					fl = new FlightList(flight1, flight2, fareeconomy, farefirst, farebusiness, cancellationcharge,
							bagallow, extrabagfare, aircraft, airline);

					flights.add(fl);
				}
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (flights.size() == 0) {
			resultcode = Error.NO_DATA;
		} else {
			resultcode = Error.SUCCESS;
		}
		result.put(resultcode, flights);
		System.out.println(result);
		return result;
	}

	public LinkedHashMap<Integer, LinkedList<FlightList>> fetchConnectedOneWayFlights(String src, String dst,
			String fromDate) {
		LinkedHashMap<Integer, LinkedList<FlightList>> result = new LinkedHashMap<Integer, LinkedList<FlightList>>();
		LinkedList<FlightList> flights = new LinkedList<FlightList>();
		int resultcode;

		FlightList fl = null;
		Flight flight1 = null;
		Route route1 = null;

		Flight flight2 = null;
		Route route2 = null;

		Aircraft aircraft = null;

		Airline airline = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
			}
			String sql = "call findConnectedOneWayFlights(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, src);
			ps.setString(2, dst);
			ps.setString(3, fromDate);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					fl = null;
					flight1 = null;
					flight2 = null;
					aircraft = null;
					route1 = null;
					route2 = null;

					int fsid = rs.getInt(1);
					int routeid = rs.getInt(2);
					String airport = rs.getString(3);
					long flightdate = rs.getTimestamp(4).getTime();

					String destination = rs.getString(5);
					long arrivaldate = rs.getTimestamp(6).getTime();

					int timeoffset = rs.getInt(7);
					int wifi = rs.getInt(8);
					double fareeconomy = rs.getDouble(9);
					double farefirst = rs.getDouble(10);
					double farebusiness = rs.getDouble(11);
					double cancellationcharge = rs.getDouble(12);
					int bagallow = rs.getInt(13);
					double extrabagfare = rs.getDouble(14);
					int aircraftid = rs.getInt(15);
					String username = rs.getString(16);
					String airlinename = rs.getString(17);

					int fsid2 = rs.getInt(18);
					int routeid2 = rs.getInt(19);
					String airport2 = rs.getString(20);
					long flightdate2 = rs.getTimestamp(21).getTime();

					String destination2 = rs.getString(22);
					long arrivaldate2 = rs.getTimestamp(23).getTime();

					int timeoffset2 = rs.getInt(24);
					int wifi2 = rs.getInt(25);

					route1 = new Route(routeid, airport, destination);
					flight1 = new Flight(fsid, route1, flightdate, arrivaldate, timeoffset, wifi);
					route2 = new Route(routeid2, airport2, destination2);
					flight2 = new Flight(fsid2, route2, flightdate2, arrivaldate2, timeoffset2, wifi2);
					aircraft = new Aircraft(aircraftid);

					airline = new Airline(username, airlinename);

					fl = new FlightList(flight1, flight2, fareeconomy, farefirst, farebusiness, cancellationcharge,
							bagallow, extrabagfare, aircraft, airline);

					flights.add(fl);
				}
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (flights.size() == 0) {
			resultcode = Error.NO_DATA;
		} else {
			resultcode = Error.SUCCESS;
		}
		result.put(resultcode, flights);
		System.out.println(result);
		return result;
	}

	public LinkedHashMap<Integer, LinkedList<FlightList>> fetchDirectOneWayFlights(String src, String dst,
			String fromDate) {
		LinkedHashMap<Integer, LinkedList<FlightList>> result = new LinkedHashMap<Integer, LinkedList<FlightList>>();
		LinkedList<FlightList> flights = new LinkedList<FlightList>();
		int resultcode;

		FlightList fl = null;
		Flight flight = null;
		Aircraft aircraft = null;
		Route route = null;
		Airline airline = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
			}
			String sql = "call findDirectOneWayFlight(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, src);
			ps.setString(2, dst);
			ps.setString(3, fromDate);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					fl = null;
					flight = null;
					aircraft = null;
					route = null;

					int fsid = rs.getInt(1);
					int routeid = rs.getInt(2);
					String airport = rs.getString(3);
					long flightdate = rs.getTimestamp(4).getTime();

					String destination = rs.getString(5);
					long arrivaldate = rs.getTimestamp(6).getTime();

					int timeoffset = rs.getInt(7);
					int wifi = rs.getInt(8);
					double fareeconomy = rs.getDouble(9);
					double farefirst = rs.getDouble(10);
					double farebusiness = rs.getDouble(11);
					double cancellationcharge = rs.getDouble(12);
					int bagallow = rs.getInt(13);
					double extrabagfare = rs.getDouble(14);
					int aircraftid = rs.getInt(15);
					String username = rs.getString(16);
					String airlinename = rs.getString(17);

					route = new Route(routeid, airport, destination);
					flight = new Flight(fsid, route, flightdate, arrivaldate, timeoffset, wifi);
					aircraft = new Aircraft(aircraftid);

					airline = new Airline(username, airlinename);

					fl = new FlightList(flight, fareeconomy, farefirst, farebusiness, cancellationcharge, bagallow,
							extrabagfare, aircraft, airline);

					flights.add(fl);
				}
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (flights.size() == 0) {
			resultcode = Error.NO_DATA;
		} else {
			resultcode = Error.SUCCESS;
		}
		result.put(resultcode, flights);
		System.out.println(result);
		return result;
	}

	public void prepareTravelDestination() {

		int resultcode;

		FlightList fl = null;
		Flight flight = null;
		Aircraft aircraft = null;
		Route route = null;
		Airline airline = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
			}
			String sql = "call findTravelDestination()";
			ps = con.prepareStatement(sql);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					fl = null;
					flight = null;
					aircraft = null;
					route = null;

					int fsid = rs.getInt(1);
					int routeid = rs.getInt(2);
					String airport = rs.getString(3);
					long flightdate = rs.getTimestamp(4).getTime();

					String destination = rs.getString(5);
					long arrivaldate = rs.getTimestamp(6).getTime();

					int timeoffset = rs.getInt(7);
					int wifi = rs.getInt(8);
					double fareeconomy = rs.getDouble(9);
					double farefirst = rs.getDouble(10);
					double farebusiness = rs.getDouble(11);
					double cancellationcharge = rs.getDouble(12);
					int bagallow = rs.getInt(13);
					double extrabagfare = rs.getDouble(14);
					int aircraftid = rs.getInt(15);
					String username = rs.getString(16);
					String airlinename = rs.getString(17);

					route = new Route(routeid, airport, destination);
					flight = new Flight(fsid, route, flightdate, arrivaldate, timeoffset, wifi);
					aircraft = new Aircraft(aircraftid);

					airline = new Airline(username, airlinename);

					fl = new FlightList(flight, fareeconomy, farefirst, farebusiness, cancellationcharge, bagallow,
							extrabagfare, aircraft, airline);

					allTravelFlights.add(fl);
				}
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (allTravelFlights.size() == 0) {
			resultcode = Error.NO_DATA;
		} else {
			resultcode = Error.SUCCESS;
		}
		travelFlightList.put(resultcode, allTravelFlights);

		System.out.println(travelFlightList);

	}

	// Login and Register User
	public int registerUser(User user) {
		int result = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "insert into login values (?,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setTimestamp(3, new Timestamp(user.getDatecreated()));
			ps.setInt(4, user.getUsertype());
			ps.setString(5, user.getFname());
			ps.setString(6, user.getLname());
			ps.setString(7, user.getSaddr());
			ps.setString(8, user.getCity());
			ps.setString(9, user.getState());
			ps.setString(10, null);
			ps.setDouble(11, 0);
			result = ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public User loginUser(String username, String password, int type) {
		User user = null;
		try {
			getConnection();
			String sql = "call login_user(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setInt(3, type);
			boolean hadResult = ps.execute();
			while (hadResult) {
				ResultSet rs = ps.getResultSet();

				while (rs.next()) {
					user = new User(rs.getString(1), rs.getString(2), rs.getTimestamp(3).getTime(), rs.getInt(4),
							rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
							rs.getTimestamp(10).getTime(), rs.getDouble(11));
					System.out.println("USER:" + user);
				}
				hadResult = ps.getMoreResults();
				System.out.println(user.toString());
			}
			closeConnection();
		} catch (Exception e) {
		}
		return user;
	}

	private void getConnection() {
		try {
			Class.forName(DRIVERS).newInstance();
			con = DriverManager.getConnection(URL + db, USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		try {
			con.close();
			con = null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int addFlight(long flightdate, long arrivaldate, double fareeconomy, double farefirst, double farebusiness,
			int aircraftid, int routeid, int timeoffset, int bagallow, double extrabag, String username, int wifi,
			double cancellationcharge) {
		int resultcode = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "insert into flightschedule values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			Timestamp t = new Timestamp(flightdate);
			ps.setTimestamp(1, t);
			t.setTime(arrivaldate);
			System.out.println(t);
			ps.setTimestamp(2, t);

			ps.setDouble(3, fareeconomy);
			ps.setDouble(4, farefirst);
			ps.setDouble(5, farebusiness);
			ps.setInt(6, aircraftid);
			ps.setInt(7, routeid);
			ps.setInt(8, bagallow);
			ps.setDouble(9, extrabag);
			ps.setInt(10, timeoffset);
			ps.setString(11, username);
			ps.setInt(12, wifi);
			ps.setDouble(13, cancellationcharge);

			resultcode = ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultcode;
	}

	public int aboutAirline(String username, String airlinename, String image, String description) {
		int resultcode = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "insert into airline values (?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, airlinename);
			ps.setString(3, image);
			ps.setString(4, description);
			resultcode = ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (resultcode == Error.SUCCESS) {
			addAirlineToAutoComplte(airlinename);
		}
		return resultcode;
	}

	public void addAirlineToAutoComplte(String airlinename) {
		String URL = "/Flyers/FlightServlet?code=airlinedetail&amp;airline=";
		String code = airlinename.replace(" ", "+");
		System.out.println(URL + code);
		try {
			getConnection();
			String sql = "insert into autocomplete values (?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, URL + code);
			ps.setString(2, airlinename);

			ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int addOffer(String offername, double discount, double amount, String description, String username,
			String promocode, int status) {
		int resultcode = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "insert into offers values(null,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, offername);
			ps.setDouble(2, discount);
			ps.setDouble(3, amount);
			ps.setString(4, description);
			ps.setString(5, username);
			ps.setString(6, promocode);
			ps.setInt(7, status);
			resultcode = ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultcode;
	}

	public int addAircraft(String aircraftname, int capacity) {
		int resultcode = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "insert into aircraft values(null,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, aircraftname);
			ps.setInt(2, capacity);
			resultcode = ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultcode;
	}

	public int addRoute(String from, String to) {
		int resultcode = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "insert into route values(null,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, from);
			ps.setString(2, to);
			resultcode = ps.executeUpdate();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultcode;
	}

	public static void main(String[] args) {
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		// msdsu.fetchConnectedReturnFlights("ORD", "AMD", "2017-10-30", "2017-11-04");
		// msdsu.fundnMyAllNextFlights("airindia@gmail.com");
		// System.out.println(msdsu.getTransactionID());
		msdsu.findMyTicket(1, "niket@gmail.com");
	}

	public int updateFlight(int fsid, double fareeconomy, double farefirst, double farebusiness, int timeoffset,
			int bagallow, double extrabag, int wifi, double cancellationcharge) {
		int resultcode = 0;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "update flightschedule set fareeconomy=? , farefirst =?, farebusiness=?, timeoffset=?, bagallow=?, extrabagfare=?, wifi=? , cancellationcharge=? where fsid =?";
			ps = con.prepareStatement(sql);
			ps.setDouble(1, fareeconomy);
			ps.setDouble(2, farefirst);
			ps.setDouble(3, farebusiness);
			ps.setInt(4, timeoffset);
			ps.setInt(5, bagallow);
			ps.setDouble(6, extrabag);
			ps.setInt(7, wifi);
			ps.setDouble(8, cancellationcharge);
			ps.setInt(9, fsid);
			resultcode = ps.executeUpdate();
			resultcode = (resultcode == 1) ? Error.SUCCESS : Error.NO_DATA;
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultcode;
	}

	public int getTransactionID() {
		int result = 0;
		try {
			getConnection();
			String sql = "select max(tsid) from transaction";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1) + 1;
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public HashMap<Integer, FlightSchedule> fetchFlightSchedule(String date, int fsid) {
		HashMap<Integer, FlightSchedule> fs = new HashMap<Integer, FlightSchedule>();
		int resultcode;
		FlightSchedule f = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
				fs.put(resultcode, null);
				return fs;
			}
			String sql = "call flightschedule(?,?) ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, fsid);
			ps.setString(2, date);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();

				while (rs.next()) {
					long flightdate = rs.getTimestamp(1).getTime();
					long arrivaldate = rs.getTimestamp(2).getTime();
					long estimatedFlightDate = rs.getTimestamp(3).getTime();
					long estimatedArrivalDate = rs.getTimestamp(4).getTime();
					int min = rs.getInt(5);
					f = new FlightSchedule(flightdate, arrivaldate, min, estimatedFlightDate, estimatedArrivalDate);
				}
				hasResult = ps.getMoreResults();
				rs.close();
			}
			if (f != null) {
				resultcode = Error.SUCCESS;
			} else {
				resultcode = Error.NO_DATA;
			}
			fs.put(resultcode, f);
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fs;
	}

	public LinkedList<Transaction> findMyTicket(int tid, String uname) {
		LinkedList<Transaction> tlist = new LinkedList<Transaction>();
		Transaction t = null;
		FlightSchedule fs = null;
		Aircraft a = null;
		Route r = null;
		Passanger p = null;
		Airline ar = null;
		Offer o = null;
		User u = null;
		try {
			getConnection();
			if (con == null) {
				return tlist;
			}
			String sql = "call findMyTicket(?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, tid);
			ps.setString(2, uname);
			boolean hasResult = ps.execute();

			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					int tsid = rs.getInt(1);
					long bookingdate = rs.getTimestamp(2).getTime();
					int seatno = rs.getInt(3);

					int psid = rs.getInt(4);

					int fsid = rs.getInt(5);

					int type = rs.getInt(6);

					String username = rs.getString(7);

					int offerid = rs.getInt(8);
					double total = rs.getDouble(9);
					String ccnum = rs.getString(10);
					int wheelchair = rs.getInt(11);
					String food = rs.getString(12);
					int cabin = rs.getInt(13);

					long flightdate = rs.getTimestamp(14).getTime();
					long arrivaldate = rs.getTimestamp(15).getTime();

					int aircraftid = rs.getInt(16);

					int routeid = rs.getInt(17);
					int bagallow = rs.getInt(18);

					String airlineusername = rs.getString(19);
					int wifi = rs.getInt(20);

					String model = rs.getString(21);
					int capacity = rs.getInt(22);
					String departure = rs.getString(23);
					String arrival = rs.getString(24);

					String pname = rs.getString(25);

					String airlineName = rs.getString(26);
					String promocode = rs.getString(27);

					o = null;
					ar = null;
					p = null;
					r = null;
					a = null;
					fs = null;
					u = null;
					t = null;

					o = new Offer(offerid, promocode);
					ar = new Airline(airlineusername, airlineName);
					p = new Passanger(psid, pname);
					r = new Route(routeid, departure, arrival);
					a = new Aircraft(aircraftid, model, capacity);
					fs = new FlightSchedule(fsid, flightdate, arrivaldate, a, r, bagallow, ar, wifi);
					u = new User(username);
					t = new Transaction(tsid, bookingdate, seatno, p, fs, type, u, o, total, ccnum, wheelchair, food,
							cabin);
					tlist.add(t);
				}
				hasResult = ps.getMoreResults();
				rs.close();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(tlist.toString());
		return tlist;
	}

	public int cancelMyTicket(int tsid) {
		int result = Error.FAIL;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "update transaction set type=0  where tsid=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, tsid);
			result = ps.executeUpdate();
			if (result > 0) {
				result = Error.SUCCESS;
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int foodOption(int tsid, int fsid, int psid, String food) {
		int result = Error.FAIL;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "update transaction set food=?  where tsid=? and fsid=? and psid =?";
			ps = con.prepareStatement(sql);
			ps.setString(1, food);
			ps.setInt(2, tsid);
			ps.setInt(3, fsid);
			ps.setInt(4, psid);
			result = ps.executeUpdate();
			if (result > 0) {
				result = Error.SUCCESS;
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int wheelOption(int tsid, int fsid, int psid, int wheel) {
		int result = Error.FAIL;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "update transaction set wheelchair=?  where tsid=? and fsid=? and psid =?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, wheel);
			ps.setInt(2, tsid);
			ps.setInt(3, fsid);
			ps.setInt(4, psid);
			result = ps.executeUpdate();
			if (result > 0) {
				result = Error.SUCCESS;
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public LinkedList<Integer> findAllSeats(int fsid) {
		LinkedList<Integer> seat = new LinkedList<Integer>();
		try {
			getConnection();
			if (con == null) {
				return seat;
			}
			String sql = "call findSeatAvailibility(?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, fsid);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					int s = rs.getInt(1);
					seat.add(s);
				}
				rs.close();
				hasResult = ps.getMoreResults();
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seat;
	}

	public int seatOption(int tsid, int fsid, int psid, int seat) {

		int result = Error.FAIL;
		try {
			getConnection();
			if (con == null) {
				return Error.SQL_NOT_RUNNING;
			}
			String sql = "update transaction set seatno=?  where tsid=? and fsid=? and psid =?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, seat);
			ps.setInt(2, tsid);
			ps.setInt(3, fsid);
			ps.setInt(4, psid);
			result = ps.executeUpdate();
			if (result > 0) {
				result = Error.SUCCESS;
			}
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public HashMap<Integer, LinkedList<Sales>> getSalesData() {
		HashMap<Integer, LinkedList<Sales>> result = new HashMap<Integer, LinkedList<Sales>>();
		int resultcode = 0;
		LinkedList<Sales> sales = new LinkedList<Sales>();
		Sales s = null;
		try {
			getConnection();
			if (con == null) {
				resultcode = Error.SQL_NOT_RUNNING;
				result.put(resultcode, null);
				return result;
			}
			String sql = "call generateSalesReport()";
			ps = con.prepareStatement(sql);
			boolean hasResult = ps.execute();
			while (hasResult) {
				ResultSet rs = ps.getResultSet();
				while (rs.next()) {
					int fsid = rs.getInt(1);
					String airlinename = rs.getString(2);
					int sale = rs.getInt(3);
					double revenue = rs.getDouble(4);
					String flight = rs.getString(5);
					s = null;
					s = new Sales(airlinename, fsid, sale, revenue, flight);
					sales.add(s);
				}
				rs.close();
				hasResult = ps.getMoreResults();
			}
			if (sales.size() > 0) {
				resultcode = Error.SUCCESS;
			} else {
				resultcode = Error.NO_DATA;
			}
			result.put(resultcode, sales);
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public HashMap<Integer, Airline> getAirlineDetail(String airline) {
		HashMap<Integer, Airline> result = new HashMap<Integer, Airline>();
		int resultcode = 0;
		Airline a = null;
		try {
			getConnection();
			if (con == null) {
				result.put(Error.SQL_NOT_RUNNING, null);
				return result;
			}
			String sql = "select * from airline where airlinename=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, airline);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String name = rs.getString(2);
				String img = rs.getString(3);
				String desc = rs.getString(4);
				a = new Airline(name, img, desc);
			}
			if (a != null) {
				result.put(Error.SUCCESS, a);
			} else {
				result.put(Error.NO_DATA, null);
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public HashMap<String, String> getAjaxData(String searchId) {
		HashMap<String, String> data = new HashMap<String, String>();
		try {
			getConnection();
			String sql = "select name, link from autocomplete where name like '%" + searchId + "%' ";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String model = rs.getString(2);
				data.put(id, model);
				System.out.println(id + " " + model);
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	public LinkedList<String> findAllAirline() {
		LinkedList<String> airlines = new LinkedList<String>();

		try {
			getConnection();
			if (con == null) {
				return null;
			}
			String sql = "select airlinename 	from airline";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				airlines.add(rs.getString(1));
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return airlines;
	}

	public HashMap<Integer, LinkedList<DailySale>> getDailySale() {
		HashMap<Integer, LinkedList<DailySale>> finalresult = new HashMap<Integer, LinkedList<DailySale>>();
		int resultcode = 0;
		LinkedList<DailySale> result = new LinkedList<DailySale>();
		DailySale ds = null;
		try {
			getConnection();
			if (con == null) {
				finalresult.put(Error.NO_DATA, null);
				return finalresult;
			}

			String sql = "select bookingdate ,sum(total),count(tsid) from transaction where type=1 group by date(bookingdate)";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ds = null;
				ds = new DailySale(rs.getTimestamp(1).getTime(), rs.getDouble(2), rs.getInt(3));
				result.add(ds);
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result.size() > 0) {
			finalresult.put(Error.SUCCESS, result);
		} else {
			finalresult.put(Error.NO_DATA, result);
		}
		return finalresult;
	}

	public LinkedList<Transaction> getTransactionByFlight(int id) {
		LinkedList<Transaction> result = new LinkedList<Transaction>();
		Transaction t = null;
		Passanger p = null;
		try {
			getConnection();
			if (con == null) {
				return null;
			}
			String sql = "select t.bookingdate,t.seatno,p.psid, p.name, p.address, p.gender, p.age,p.passportno, p.nationality, p.contact, p.freqflyerno "
					+ "from transaction t , passanger p  where t.psid=p.psid and t.fsid=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				long d = rs.getTime(1).getTime();
				int seatno = rs.getInt(2);
				p = new Passanger(rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8),
						rs.getString(9), rs.getString(10), rs.getString(11));
				t = new Transaction(d, seatno, p);
				result.add(t);
			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void updateOffer(String promoCode)
	{
		try {
			getConnection();

			String updateOffer = "Update offers set active=0 where promocode=?";
			ps = con.prepareStatement(updateOffer);
			ps.setString(1, promoCode);
			ps.executeUpdate();

		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public LinkedHashMap<String, ArrayList<Object>> getPromos(String username)
	{
		LinkedHashMap<String, ArrayList<Object>> promos = new LinkedHashMap<String, ArrayList<Object>>();

		try {
			getConnection();
			if (con == null) {
				return null;
			}
			String sql = "select promo from transaction where username=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ArrayList<Object> itemArray = new ArrayList<Object>();

				String promo = rs.getString(1);

				itemArray.add(promo);

				promos.put(promo, itemArray);

			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return promos;
	}

	public LinkedHashMap<String, ArrayList<Object>> getOffers()
	{
		LinkedHashMap<String, ArrayList<Object>> offers = new LinkedHashMap<String, ArrayList<Object>>();

		try {
			getConnection();
			if (con == null) {
				return null;
			}
			String sql = "select offername,description,promocode from offers where active=1;";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ArrayList<Object> itemArray = new ArrayList<Object>();

				String offerName = rs.getString(1);
				String description = rs.getString(2);
				String promocode = rs.getString(3);


				itemArray.add(offerName);
				itemArray.add(description);
				itemArray.add(promocode);

				offers.put(offerName, itemArray);

			}
			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return offers;
	}


	public ArrayList<Object> getRoutesFromMySQL() {
		ArrayList<Object> routes = new ArrayList<Object>();

		HashMap<String, Route> routesMap = new HashMap<String, Route>();
		Route route;

		try {
			getConnection();

			if (con == null) {
				return null;
			}

			String sql = "select * from route";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();

			while (rs.next()) {
				String airport = rs.getString("airport");

				String destination = rs.getString("destination");

				route = new Route();
				route.setAirport(airport);
				route.setDestination(destination);

				String key = airport + " - " + destination;

				routesMap.put(key, route);
				routes.add(routesMap);
				// System.out.println(routes);

			}

			rs.close();
			ps.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return routes;
	}

	public LinkedHashMap<Integer, String> getFlights() {
		LinkedHashMap<Integer, String> result = new LinkedHashMap<Integer, String>();
		try {
			getConnection();
			if (con == null) {
				return null;
			}
			Statement s = con.createStatement();
			s.executeQuery("select routeid, concat(airport,'-',destination) as routes from flyers.route");
			ResultSet rs = s.getResultSet();

			while (rs.next()) {
				int id = rs.getInt(1);
				String path = rs.getString(2);

				result.put(id, path);
			}
			rs.close();
			s.close();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}
}
