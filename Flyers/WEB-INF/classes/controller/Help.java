package controller;


import java.io.IOException;

import java.util.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.mail.*;
import javax.mail.internet.*;

public class Help extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String useremail = request.getParameter("email");
		String question = request.getParameter("question");
		String subject = request.getParameter("subject");


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
				 props.put("mail.smtp.starttls.enable", "true");
				 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		     final String email = "team1.airlinebooking@gmail.com";//
		     final String password = "Team1@123";

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
		                      InternetAddress.parse(email,false));
		     msg.setSubject(subject);
		     String newline = System.getProperty("line.separator");
		     String messageContent = "From "+ name + ":" + newline + newline + question;

		     msg.setText(messageContent);
		     msg.setReplyTo(new javax.mail.Address[]
		    		 {
		    		     new javax.mail.internet.InternetAddress(useremail)
		    		 });

		     msg.setSentDate(new Date());
		     Transport.send(msg);
		     String text = "Your query sent. We will get back to you shortly.";
		     response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(text);
		  }catch (MessagingException e){ System.out.println("Error: " + e);}

	}

}
