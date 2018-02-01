package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Error;
import model.MySqlDataStoreUtilities;
import pojo.User;

public class Registration extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int usertype = Integer.parseInt(request.getParameter("usertype"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String saddr = request.getParameter("saddr");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		long datecreated = System.currentTimeMillis();
		double balance = 0;
		long lastlogin = System.currentTimeMillis();
		User user = new User(email, password, datecreated, usertype, fname, lname, saddr, city, state, lastlogin,
				balance);
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		int resultcode = msdsu.registerUser(user);

		if (resultcode == Error.SQL_NOT_RUNNING) {
			response.sendRedirect("/Flyers/error.jsp/errorcode=" + resultcode);
		} else {
			response.sendRedirect("/Flyers/registration.jsp");
		}

	}
}
