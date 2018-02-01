package controller;

import java.io.IOException;
import java.util.*;

import model.MySqlDataStoreUtilities;
import pojo.User;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckPromo extends HttpServlet {

	User user = null;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("promo");
		
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			user = (User) session.getAttribute("user");
			
		
		LinkedHashMap<String, ArrayList<Object>> promos;
		promos = msdsu.getPromos(user.getUsername());
		for(Map.Entry<String, ArrayList<Object>> m :promos.entrySet())
		{
			ArrayList<Object> values = m.getValue();
			if(values.contains(code))
			{
				String text = "Promo Code already used";
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(text);
			}
		}
		
		}
	}
}