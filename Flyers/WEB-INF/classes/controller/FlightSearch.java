package controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Error;
import model.MySqlDataStoreUtilities;
import pojo.FlightList;
import pojo.FlightSchedule;

public class FlightSearch extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String trip = request.getParameter("trip");
		String src = request.getParameter("departuer");
		String dst = request.getParameter("arrival");
		String fromDate = request.getParameter("ddate");
		String toDate = request.getParameter("rdate");
		String cabinclass = request.getParameter("cabinclass");
		int nop = Integer.parseInt(request.getParameter("nop"));
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		if (trip.equalsIgnoreCase("rt")) {

			LinkedHashMap<Integer, LinkedList<FlightList>> allFlights = msdsu.getAllReturnFlight(src, dst, fromDate,
					toDate);
			String head = src + "-" + dst + " , " + fromDate + " , " + dst + "-" + src + " , " + toDate;
			request.setAttribute("flightList", allFlights.get(Error.SUCCESS));
			request.setAttribute("flightDetail", head);
			RequestDispatcher rd = request
					.getRequestDispatcher("flightlisting.jsp?nop=" + nop + "&cabin=" + cabinclass + "&trip=" + trip);
			rd.include(request, response);

		} else if (trip.equalsIgnoreCase("ow")) {
			LinkedHashMap<Integer, LinkedList<FlightList>> allFlights = msdsu.getAllOneWayFlight(src, dst, fromDate);
			String head = fromDate + " ,  " + src + "-" + dst;
			request.setAttribute("flightList", allFlights.get(Error.SUCCESS));
			request.setAttribute("flightDetail", head);
			RequestDispatcher rd = request
					.getRequestDispatcher("flightlisting.jsp?nop=" + nop + "&cabin=" + cabinclass + "&trip=" + trip);
			rd.include(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
