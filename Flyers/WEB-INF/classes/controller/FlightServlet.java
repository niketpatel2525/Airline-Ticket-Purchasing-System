package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URL;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.File;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Error;
import model.MongoDBDataStoreUtilities;
import model.MySqlDataStoreUtilities;
import pojo.Airline;
import pojo.DailySale;
import pojo.Flight;
import pojo.FlightList;
import pojo.FlightSchedule;
import pojo.Passanger;
import pojo.Review;
import pojo.Sales;
import pojo.Transaction;
import pojo.User;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.html.simpleparser.HTMLWorker;

import java.io.FileOutputStream;
import java.io.FileNotFoundException;

import java.text.DecimalFormat;


public class FlightServlet extends HttpServlet {
	User user = null;

	public void init(ServletConfig config) throws ServletException {
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		msdsu.prepareTravelDestination();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");





		HttpSession session = request.getSession(false);
		if (session != null) {
			user = (User) session.getAttribute("user");
			System.out.println("SES USER:" + user + "Sess:" + session);
		}


		System.out.println("Code: " + code);
		if (code.equalsIgnoreCase("addflight")) {
			redirect(request, response);
			addFlight(request, response);
		} else if (code.equalsIgnoreCase("aboutairline")) {
			redirect(request, response);
			aboutAirline(request, response);
		} else if (code.equalsIgnoreCase("addoffer")) {
			redirect(request, response);
			addOffer(request, response);
		} else if (code.equalsIgnoreCase("aircraft")) {
			redirect(request, response);
			addAircraft(request, response);
		} else if (code.equalsIgnoreCase("addroute")) {
			redirect(request, response);
			addRoute(request, response);
		} else if (code.equalsIgnoreCase("mynextflights")) {
			redirect(request, response);
			findMyAllNextFlights(request, response);
		} else if (code.equalsIgnoreCase("updateform")) {
			redirect(request, response);
			getFlightUpdateForm(request, response);
		} else if (code.equalsIgnoreCase("updateflight")) {
			redirect(request, response);
			updateFlight(request, response);
		} else if (code.equalsIgnoreCase("bookticket")) {
			redirect(request, response);
			bookMyTicket(request, response);
		} else if (code.equalsIgnoreCase("flightschedule")) {
			fetchFlightSchedule(request, response);
		} else if (code.equalsIgnoreCase("findMyTicket")) {
			redirect(request, response);
			findMyTicket(request, response);
		} else if (code.equalsIgnoreCase("cancelticket")) {
			redirect(request, response);
			cancelMyTicket(request, response);
		} else if (code.equalsIgnoreCase("food")) {
			redirect(request, response);
			foodOption(request, response);
		} else if (code.equalsIgnoreCase("wheel")) {
			redirect(request, response);
			wheelOption(request, response);
		} else if (code.equalsIgnoreCase("seat")) {
			redirect(request, response);
			seatOption(request, response);
		} else if (code.equalsIgnoreCase("salesreportbytable")) {
			redirect(request, response);
			salesReportByTable(request, response);
		} else if (code.equalsIgnoreCase("salesreportbyChart")) {
			redirect(request, response);
			salesReportByChart(request, response);
		} else if (code.equalsIgnoreCase("airlinedetail")) {
			airlineDetail(request, response);
		} else if (code.equalsIgnoreCase("addreview")) {
			redirect(request, response);
			addReview(request, response);
		} else if (code.equalsIgnoreCase("autocomplete")) {
			autoComplete(request, response);
		} else if (code.equalsIgnoreCase("signin")) {
			signing(request, response);
		} else if (code.equalsIgnoreCase("searchforairline")) {
			searchForAirline(request, response);
		} else if (code.equalsIgnoreCase("signout")) {
			signOut(request, response);
		} else if (code.equalsIgnoreCase("viewByFlight")) {
			viewByFlight(request, response);
		}
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession ses = request.getSession(false);
		if (ses == null || (ses.getAttribute("user") == null)) {
			response.sendRedirect("/Flyers/signin.jsp");
		}
	}

	private void viewByFlight(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("fsid"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		LinkedList<Transaction> tlist = msdsu.getTransactionByFlight(id);
		System.out.println(tlist);
		request.setAttribute("tlist", tlist);
		RequestDispatcher rd = request.getRequestDispatcher("viewByFlight.jsp");
		rd.include(request, response);
	}

	private void signOut(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession(false);
		session.setAttribute("user", null);
		session.invalidate();
		session = null;
		response.sendRedirect("/Flyers/");
	}

	private void searchForAirline(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		LinkedList<String> airlines = msdsu.findAllAirline();
		if (airlines == null) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + Error.NO_DATA);
		} else {
			request.setAttribute("airline", airlines);
			RequestDispatcher rd = request.getRequestDispatcher("listAirline.jsp");
			rd.include(request, response);
		}
	}

	private void signing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int utype = Integer.parseInt(request.getParameter("utype"));
		System.out.println(email + " " + password + " " + utype);
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		User cuser = msdsu.loginUser(email, password, utype);

		if (cuser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", cuser);
			System.out.println(cuser);
			response.sendRedirect("/Flyers/");
		} else {
			request.setAttribute("msg", "**Username or Password is invalid!");
			RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
			rd.include(request, response);
		}

	}

	private void autoComplete(HttpServletRequest request, HttpServletResponse response) {
		String searchId = request.getParameter("searchId");
		System.out.println(searchId);
		try {
			StringBuffer sb = new StringBuffer();
			boolean namesAdded = false;

			if (!searchId.equals("")) {
				AjaxUtility a = new AjaxUtility();
				sb = a.readdata(searchId);
				if (sb != null || !sb.equals("")) {
					namesAdded = true;
				}
				if (namesAdded) {
					response.setContentType("text/xml");
					response.getWriter().write("<results>" + sb.toString() + "</results >");
					System.out.println("<results>" + sb.toString() + "</results >");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addReview(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String airline = request.getParameter("airline");
		String name = request.getParameter("name");
		String date = request.getParameter("fdate");
		String route = request.getParameter("route");
		String country = request.getParameter("country");
		String review = request.getParameter("review");
		long cdate = System.currentTimeMillis();
		int ratings = Integer.parseInt(request.getParameter("rating"));

		Review r = new Review(airline, name, date, route, country, review, ratings, cdate);

		MongoDBDataStoreUtilities mdsu = new MongoDBDataStoreUtilities();
		int result = mdsu.storeReview(r);
		if (result > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("FlightServlet?code=airlinedetail&airline=" + airline);
			rd.include(request, response);
		} else {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + result);
		}

	}

	private void airlineDetail(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String airline = request.getParameter("airline");
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		HashMap<Integer, Airline> data = msdsu.getAirlineDetail(airline);
		for (Map.Entry<Integer, Airline> d : data.entrySet()) {
			int r = d.getKey();
			Airline a = d.getValue();
			if (r == Error.SUCCESS) {
				request.setAttribute("airline", a);
				RequestDispatcher rd = request.getRequestDispatcher("airline.jsp");
				rd.include(request, response);
			} else {
				response.sendRedirect("/Flyers/error.jsp?errorcode=" + r);
			}
		}

	}

	private void salesReportByChart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		HashMap<Integer, LinkedList<Sales>> sales = msdsu.getSalesData();

		for (Map.Entry<Integer, LinkedList<Sales>> sale : sales.entrySet()) {
			int resultcode = sale.getKey();
			LinkedList<Sales> sd = sale.getValue();
			if (resultcode == Error.SUCCESS) {
				Gson gson = new Gson();
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(sd));
				System.out.println(sd.toString());
			}
		}

	}

	private void salesReportByTable(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		HashMap<Integer, LinkedList<Sales>> sales = msdsu.getSalesData();
		HashMap<Integer, LinkedList<DailySale>> dailySale = msdsu.getDailySale();
		for (Map.Entry<Integer, LinkedList<DailySale>> sale : dailySale.entrySet()) {
			int resultcode = sale.getKey();
			if (resultcode == Error.SUCCESS) {
				request.setAttribute("dailysale", sale.getValue());
			}

			/////////////////
			StringBuilder htmlBuilder = new StringBuilder();

			htmlBuilder.append("<html><h1>Flyers</h1><br><h3>Daily Sales Report</h3><br><table>");

			htmlBuilder.append("<thead><tr><th>Date</th><th>Ticket Sold</th><th>Total Sale</th></tr></thead><tbody>");


			DecimalFormat df = new DecimalFormat(".##");
			for (DailySale s : sale.getValue()) {

				Date d = new Date(s.getDate());
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				htmlBuilder.append("<tr>");
				htmlBuilder.append("<td>"+ sdf.format(d) +"</td>");
				htmlBuilder.append("<td>"+s.getTotaltickets() +"</td>");
				htmlBuilder.append("<td>"+ s.getTotalsale() +"</td>");
				htmlBuilder.append("</tr>");
			}

			htmlBuilder.append("</tbody></table></html>");


			String html = htmlBuilder.toString();
			System.out.println(html);

		     Document document = new Document();

		        try {
		        	String workingDir = System.getProperty("user.dir");

		            PdfWriter.getInstance(document,
		                new FileOutputStream(workingDir+"\\"+"DailySalesReport.pdf"));

		            document.open();
		            HTMLWorker htmlWorker = new HTMLWorker(document);
				      String str = html;
				      htmlWorker.parse(new StringReader(str));

				      System.out.println("Done");

		            document.close();

		        } catch (DocumentException e) {
		            e.printStackTrace();
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        }



			///////////////
		}

		for (Map.Entry<Integer, LinkedList<Sales>> sale : sales.entrySet()) {
			int resultcode = sale.getKey();
			LinkedList<Sales> sd = sale.getValue();


			if (resultcode == Error.SUCCESS) {
				request.setAttribute("salesdata", sd);
			}


			////////////////////
			StringBuilder htmlBuilder = new StringBuilder();

			htmlBuilder.append("<html><h1>Flyers</h1><br><h3>Total Sales Report</h3><br><table>");

			htmlBuilder.append("<thead><tr><th>Airline</th><th>Flight</th><th>Flight</th><th>Ticket Sold</th><th>Revenue</th></tr></thead><tbody>");


			DecimalFormat df = new DecimalFormat(".##");
			for (Sales s : sd) {

				htmlBuilder.append("<tr>");
				htmlBuilder.append("<td>"+ s.getAirlinename() +"</td>");
				htmlBuilder.append("<td>"+ s.getFlightid() +"</td>");
				htmlBuilder.append("<td>"+ s.getFlight() +"</td>");
				htmlBuilder.append("<td>"+ s.getTicketsold() +"</td>");
				htmlBuilder.append("<td>"+ df.format(s.getRevenue()) +"</td>");
				htmlBuilder.append("</tr>");
			}

			htmlBuilder.append("</tbody></table></html>");


			String html = htmlBuilder.toString();
			System.out.println(html);

		     Document document = new Document();

		        try {
		        	String workingDir = System.getProperty("user.dir");

		            PdfWriter.getInstance(document,
		                new FileOutputStream(workingDir+"\\"+"SalesReport.pdf"));

		            document.open();
		            HTMLWorker htmlWorker = new HTMLWorker(document);
				      String str = html;
				      htmlWorker.parse(new StringReader(str));

				      System.out.println("Done");

		            document.close();

		        } catch (DocumentException e) {
		            e.printStackTrace();
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        }

			/////////////////

		}
		RequestDispatcher rd = request.getRequestDispatcher("salesReport.jsp");
		rd.include(request, response);
	}

	private void seatOption(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// RT
		int tsid = Integer.parseInt(request.getParameter("tsid"));
		int fsid = Integer.parseInt(request.getParameter("fsid"));
		int psid = Integer.parseInt(request.getParameter("psid"));
		int seat = Integer.parseInt(request.getParameter("seat"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int result = msdsu.seatOption(tsid, fsid, psid, seat);

		if (result > 0) {
			request.setAttribute("msg", "**Seat number updated!");
			RequestDispatcher rd = request.getRequestDispatcher("findMyTicket.jsp");
			rd.include(request, response);
		} else {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + result);
		}

	}

	private void wheelOption(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// RT
		int tsid = Integer.parseInt(request.getParameter("tsid"));
		int fsid = Integer.parseInt(request.getParameter("fsid"));
		int psid = Integer.parseInt(request.getParameter("psid"));
		int wheel = Integer.parseInt(request.getParameter("wheel"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int result = msdsu.wheelOption(tsid, fsid, psid, wheel);

		if (result > 0) {
			request.setAttribute("msg", "**Wheel Chair option updated!");
			RequestDispatcher rd = request.getRequestDispatcher("findMyTicket.jsp");
			rd.include(request, response);
		} else {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + result);
		}

	}

	private void foodOption(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// RT
		int tsid = Integer.parseInt(request.getParameter("tsid"));
		int fsid = Integer.parseInt(request.getParameter("fsid"));
		int psid = Integer.parseInt(request.getParameter("psid"));
		String food = request.getParameter("food");
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int result = msdsu.foodOption(tsid, fsid, psid, food);

		if (result > 0) {
			request.setAttribute("msg", "**Food option updated!");
			RequestDispatcher rd = request.getRequestDispatcher("findMyTicket.jsp");
			rd.include(request, response);
		} else {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + result);
		}
	}

	private void cancelMyTicket(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// RT
		int tsid = Integer.parseInt(request.getParameter("tsid"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int result = msdsu.cancelMyTicket(tsid);

		if (result > 0) {
			request.setAttribute("msg", "**Ticket Cancelled Successfully!");
			RequestDispatcher rd = request.getRequestDispatcher("findMyTicket.jsp");
			rd.include(request, response);
		} else {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + result);
		}
	}

	private void findMyTicket(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// RT
		int tsid = 0;
		try {
			tsid = Integer.parseInt(request.getParameter("tsid"));
		} catch (Exception e) {
			tsid = 0;
		}

		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		LinkedList<Transaction> tlist = null;

		if (user.getUsertype() == 1) {
			tlist = msdsu.findMyTicket(tsid, "XXXXXXX");
		} else if (user.getUsertype() == 0) {
			tlist = msdsu.findMyTicket(tsid, user.getUsername());
		}

		if (tlist.size() > 0) {
			request.setAttribute("transactionlist", tlist);
			RequestDispatcher rd = request.getRequestDispatcher("findMyTicket.jsp");
			rd.include(request, response);
		} else {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + Error.NO_DATA);
		}

	}

	private void fetchFlightSchedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// RT
		String date = request.getParameter("departuer");
		int fsid = Integer.parseInt(request.getParameter("flightid"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		HashMap<Integer, FlightSchedule> flight = msdsu.fetchFlightSchedule(date, fsid);

		if (flight.containsKey(Error.SUCCESS)) {
			FlightSchedule fs = flight.get(Error.SUCCESS);
			request.setAttribute("flightschedule", fs);
			RequestDispatcher rd = request.getRequestDispatcher("flightstatus.jsp");
			rd.include(request, response);

		} else {
			for (Map.Entry<Integer, FlightSchedule> f : flight.entrySet()) {
				int rscode = f.getKey();
				response.sendRedirect("/Flyers/error.jsp?errorcode=" + rscode);
			}
		}

	}

	private void bookMyTicket(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// RT
		int flightid = Integer.parseInt(request.getParameter("flightid"));
		int nop = Integer.parseInt(request.getParameter("nop"));
		int cabin = Integer.parseInt(request.getParameter("cabin"));
		long bookingdate = System.currentTimeMillis();
		String passengerName="";

		Passanger p[] = new Passanger[nop];
		for (int i = 0; i < nop; i++) {
			String pname = request.getParameter("pname" + i);
			passengerName = pname;

			String gender = request.getParameter("gender" + i);
			int age = Integer.parseInt(request.getParameter("age" + i));
			String passportno = request.getParameter("passport" + i);
			String nationality = request.getParameter("nationality" + i);
			String cno = request.getParameter("cno" + i);
			String addr = request.getParameter("addr" + i);
			String ffn = request.getParameter("ffn" + i);


			//String pemail = request.getParameter("username");


			p[i] = new Passanger(pname, addr, gender, age, passportno, nationality, cno, ffn);
		}
		String ccname = request.getParameter("ccname");
		String ccnum = request.getParameter("ccnumber");
		String promo = request.getParameter("promo");

		FlightList fl = MySqlDataStoreUtilities.getFlightList(flightid);
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int tsid = msdsu.getTransactionID();
		int type = 1; // Booking = 1
		String username = user.getUsername(); // needs to change
		//double fare = (cabin == 0) ? fl.getFareeconomy()
				//: ((cabin == 1) ? fl.getFarefirst() : (cabin == 2) ? fl.getFarebusiness() : 0);
		double fare = Double.parseDouble(request.getParameter("totalfareamount"));
		System.out.println(promo);
		//msdsu.updateOffer(promo);

		int size = fl.getFlights().size();

		List<String> airports = new ArrayList<String>();
		List<String> destinations = new ArrayList<String>();
		List<String> flightDates = new ArrayList<String>();
		List<String> arrivalDates = new ArrayList<String>();

		DateFormat date = new SimpleDateFormat("MMM dd, yyyy HH:mm");

		for (Flight f : fl.getFlights()) {
			int fsid = f.getFsid();

			airports.add(f.getRoute().getAirport());
			destinations.add(f.getRoute().getDestination());

			flightDates.add(date.format(new Date(f.getFlightdate())));
			arrivalDates.add(date.format(new Date(f.getArrivaldate())));



			//System.out.println(airports);
			//System.out.println(destinations);

			for (int i = 0; i < nop; i++) {
				int resultcode = msdsu.bookTicket(tsid, bookingdate, p[i], fsid, type, username, fare / size, ccnum,
						cabin,promo);
			}

		}

		//System.out.println(fl.getFlights());
		//System.out.println(fl.getFlights().get(1).getRoute());

		String cabinClass = "";

		if (cabin == 0)
		{
			cabinClass = "Economy";
		}
		else if (cabin == 1)
		{
			cabinClass = "First";
		}
		else
		{
			cabinClass = "Business";
		}
		// Email The Ticket

		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		  // Get a Properties object
		     Properties props = System.getProperties();
		     props.setProperty("mail.smtp.host", "smtp.gmail.com");
		     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		     props.setProperty("mail.smtp.socketFactory.fallback", "false");
		     props.setProperty("mail.smtp.port", "465");
		     props.setProperty("mail.smtp.socketFactory.port", "465");
		     props.put("mail.smtp.auth", "true");
		     props.put("mail.debug", "true");
		     props.put("mail.store.protocol", "pop3");
		     props.put("mail.transport.protocol", "smtp");
		     final String email = "team1.airlinebooking@gmail.com";//
		     final String password = "Team1@123";
		     Timestamp t = new Timestamp(bookingdate);
		     try{
		     Session session = Session.getDefaultInstance(props,
		                          new Authenticator(){
		                             protected PasswordAuthentication getPasswordAuthentication() {
		                                return new PasswordAuthentication(email, password);
		                             }});

		   // -- Create a new message --
		     Message msg = new MimeMessage(session);

		  // -- Set the FROM and TO fields --
		     msg.setFrom(new InternetAddress(email));
		     msg.setRecipients(Message.RecipientType.TO,
		                      InternetAddress.parse(username,false));
		     msg.setSubject("Ticket");



		     int n = airports.size();

		     StringBuilder htmlBuilder = new StringBuilder();
		     htmlBuilder.append("<html>");
		     htmlBuilder.append("<h1>Flyers</h1><br>");
		     htmlBuilder.append("<h3>This is your ticket:</h3><br>");
		     htmlBuilder.append("<table><tr><td>Ticket ID:</td><td>"+tsid+"</td></tr>");
		     htmlBuilder.append("<tr><td>Passenger Name:</td><td>"+passengerName+"</td></tr>");
		     htmlBuilder.append("<tr><td>Passenger Email:</td><td>"+username+"</td></tr>");
		     htmlBuilder.append("<tr><td>Booking Date:</td><td>"+t+"</td></tr>");
		     htmlBuilder.append("<tr><td>Cabin Class:</td><td>"+cabinClass+"</td></tr>");
		     htmlBuilder.append("<tr><td>Number of Passengers:</td><td>"+nop+"</td></tr>");
		     htmlBuilder.append("<tr><td>Fare:</td><td>"+fare+"</td></tr>");
		     for (int i=0; i<n; i++)
		     {
		    	htmlBuilder.append("<tr><td>"+airports.get(i)+"</td><td>" + destinations.get(i)+"</td></tr>");
		    	htmlBuilder.append("<tr><td>"+flightDates.get(i)+"</td><td>" + arrivalDates.get(i)+"</td></tr>");
		     }

		     htmlBuilder.append("</table>");
		     htmlBuilder.append("</html>");
		     String html = htmlBuilder.toString();
		     Document document = new Document();

		        try {

		        	String workingDir = System.getProperty("user.dir");

		            PdfWriter.getInstance(document,
		                new FileOutputStream(workingDir+"\\ticket-"+username+tsid+".pdf"));

		            document.open();
		            HTMLWorker htmlWorker = new HTMLWorker(document);
				      String str = html;
				      htmlWorker.parse(new StringReader(str));

				      //System.out.println("Done");

		            document.close();

		        } catch (DocumentException e) {
		            e.printStackTrace();
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        }

		     msg.setContent(html,"text/html" );

		     msg.setSentDate(new Date());
		     Transport.send(msg);
		     System.out.println("Message sent.");
		  }catch (MessagingException e){ System.out.println("Error: " + e);}

		     /////





		     //////
	// To The Servlet

		request.setAttribute("ticket", tsid);
		request.setAttribute("fare", fare);
		request.setAttribute("username", username);
		RequestDispatcher rd = request.getRequestDispatcher("ticketbooked.jsp");
		rd.include(request, response);

	}

	private void updateFlight(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// RT
		int fsid = Integer.parseInt(request.getParameter("fsid"));
		double fareeconomy = Double.parseDouble(request.getParameter("fareeconomy"));
		double farefirst = Double.parseDouble(request.getParameter("farefirst"));
		double farebusiness = Double.parseDouble(request.getParameter("farebusiness"));

		int timeoffset = Integer.parseInt(request.getParameter("delay"));
		int bagallow = Integer.parseInt(request.getParameter("bagallow"));
		double extrabag = Double.parseDouble(request.getParameter("extrabag"));
		int wifi = Integer.parseInt(request.getParameter("wifi"));
		double cancellationcharge = Double.parseDouble(request.getParameter("cancellationcost"));

		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.updateFlight(fsid, fareeconomy, farefirst, farebusiness, timeoffset, bagallow, extrabag,
				wifi, cancellationcharge);

		if (resultcode != Error.SUCCESS) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/home.jsp");
		}

	}

	private void getFlightUpdateForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// RT
		int id = Integer.parseInt(request.getParameter("fsid"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		FlightSchedule fs = msdsu.getFlightSchedule(id);
		request.setAttribute("flight", fs);
		RequestDispatcher rd = request.getRequestDispatcher("updateflightschedule.jsp");
		rd.include(request, response);

	}

	private void findMyAllNextFlights(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// RT
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		HashMap<Integer, LinkedList<FlightSchedule>> nextFlights = null;
		if (user.getUsertype() == 1) {
			nextFlights = msdsu.fundnMyAllNextFlights("XXXXXX");
		} else if (user.getUsertype() == 2) {
			nextFlights = msdsu.fundnMyAllNextFlights(user.getUsername());
		}

		for (Map.Entry<Integer, LinkedList<FlightSchedule>> flights : nextFlights.entrySet()) {
			request.setAttribute("myFlights", flights.getValue());
			RequestDispatcher rd = request.getRequestDispatcher("listflight.jsp");
			rd.include(request, response);
		}
	}

	private void addRoute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// R T
		String from = request.getParameter("from").toUpperCase();
		String to = request.getParameter("to").toUpperCase();
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.addRoute(from, to);
		if (resultcode != 1) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/addroute.jsp");
		}
	}

	private void addAircraft(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// R T
		String aircraftname = request.getParameter("aircraftname");
		int capacity = Integer.parseInt(request.getParameter("capacity"));

		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.addAircraft(aircraftname, capacity);
		if (resultcode != 1) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/addaircraft.jsp");
		}
	}

	private void addOffer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// RT
		String offername = request.getParameter("offername");
		String description = request.getParameter("offerdescription");
		double discount = Double.parseDouble(request.getParameter("discount"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		String promocode = request.getParameter("promocode");
		int status = Integer.parseInt(request.getParameter("offerstatus"));

		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.addOffer(offername, discount, amount, description, user.getUsername(), promocode,
				status);
		if (resultcode != 1) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/addoffers.jsp");
		}
	}

	private void aboutAirline(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// R T
		String airlinename = request.getParameter("airlinename");
		String image = "images/" + request.getParameter("image");
		String description = request.getParameter("description");

		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.aboutAirline(user.getUsername(), airlinename, image, description);
		if (resultcode != 1) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/aboutairline.jsp");
		}
	}

	private void addFlight(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// R T

		String departuerdate = request.getParameter("departuredate");
		String departuertime = request.getParameter("departuretime");
		String fdate = departuerdate + " " + departuertime + ":00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		long flightdate = 0;
		try {
			flightdate = sdf.parse(fdate).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String adate = request.getParameter("arrivaldate");
		String atime = request.getParameter("arrivaltime");
		String adate1 = adate + " " + atime + ":00";
		// Date ad = new Date(adate1);
		long arrivaldate = 0;
		try {
			arrivaldate = sdf.parse(adate1).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		double fareeconomy = Double.parseDouble(request.getParameter("fareeconomy"));
		double farefirst = Double.parseDouble(request.getParameter("farefirst"));
		double farebusiness = Double.parseDouble(request.getParameter("farebusiness"));

		int aircraftid = Integer.parseInt(request.getParameter("aircraft"));
		int routeid = Integer.parseInt(request.getParameter("route"));

		int timeoffset = Integer.parseInt(request.getParameter("delay"));
		int bagallow = Integer.parseInt(request.getParameter("bagallow"));
		double extrabag = Double.parseDouble(request.getParameter("extrabag"));
		int wifi = Integer.parseInt(request.getParameter("wifi"));
		double cancellationcharge = Double.parseDouble(request.getParameter("cancellationcost"));

		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.addFlight(flightdate, arrivaldate, fareeconomy, farefirst, farebusiness, aircraftid,
				routeid, timeoffset, bagallow, extrabag, user.getUsername(), wifi, cancellationcharge);

		if (resultcode != 1) {
			response.sendRedirect("/Flyers/error.jsp?errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/addflight.jsp");
		}

	}

}
