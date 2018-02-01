<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Flyers</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="styles/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="styles/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="styles/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="styles/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="styles/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet" href="styles/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="styles/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet" href="styles/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="styles/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="styles/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" type="text/css" href="styles/datatables.min.css" />
<link rel="stylesheet" href="styles/mystyle.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<%
	User user = null;
	session = request.getSession(false);
	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
	}
%>
<body class="hold-transition skin-blue sidebar-mini" onload="init()">
	<script type="text/javascript" src="scripts/autocomplete.js"></script>
	<div class="wrapper">
		<header class="main-header"> <!-- Logo --> <a href="home.jsp" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"></span>
			<!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><i class="fa fa-plane rspace" aria-hidden="true"></i> <b>Flyers</b></span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav class="navbar navbar-static-top">
		<div class="navbar-custom-menu full-width">
			<ul class="nav navbar-nav full-width">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu">
					<a href="/Flyers/home.jsp"> Home </a>
				</li>
				<li class="dropdown messages-menu">
					<a href="/Flyers/FlightServlet?code=searchforairline"> Airlines </a>
				</li>
				<li class="dropdown messages-menu">
					<a href="/Flyers/flightstatus.jsp"> Flight Status </a>
				</li>
				<li class="dropdown messages-menu">
				<%
					if (user != null)
					{
						int userType = user.getUsertype();
						if(userType == 0)
						{%>
							<a href="/Flyers/offers.jsp"> Offers </a>
						<%}

						else
						{%>
							<a href="/Flyers/addoffers.jsp"> Offers </a>
						<%}
					}
					else
					{%>
						<a onClick="showAlert(); return false; "href=""> Offers </a>
					<%}


				%>

				</li>
				<li class="dropdown messages-menu" id="noll">
					<a href="/Flyers/help.jsp"> Help </a>
				</li>
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdowns user user-menu pull-right">
					<%
						if (user == null) {
					%>
					<a href="/Flyers/signin.jsp" class="dropdown-toggle">
						<img src="images/user_m.png" class="user-image" alt="User Image">
						<span class="hidden-xs">My Account</span>
					</a>
					<%
						} else {
					%>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="images/user_m.png" class="user-image" alt="User Image">
						<span class="hidden-xs">My Account</span>
					</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header">
							<img src="images/user_m.png" class="img-circle" alt="User Image">
							<p>
								<%
									if (user != null)
											out.print(user.getFname() + " " + user.getLname());
										DateFormat dayFormat = new SimpleDateFormat("MMM, yyyy");
								%>
								<small>Member since <%
									if (user != null)
											out.print(dayFormat.format(new Date(user.getDatecreated())));
								%></small> <small>Last Login: <%
 	if (user != null) {
 			Date ll = new Date(user.getLastlogin());
 			out.print(ll.toLocaleString());
 		}
 %></small>
							</p>
						</li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center pull-left">
									<a href="/Flyers/findMyTicket.jsp">Flights</a>
								</div>
								<div class="col-xs-4 text-center pull-right">
									<a href="/Flyers/findMyTicket.jsp">History</a>
								</div>
							</div>
						</li>
						<li class="user-footer">
							<div class="pull-left">
								<a href="/Flyers/profile.jsp" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="/Flyers/FlightServlet?code=signout" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul>
					<%
						}
					%>
				</li>
				<li class="dropdown messages-menu lspace pull-right">
					<input type="text" placeholder="search" class="input-lg search-input" id="searchId" placeholder="Search here" onkeyup="doCompletion()">
					<div id="auto-row">
						<table id="complete-table" class="gridtable" style="position: absolute; width: 96%">
						</table>
					</div>
				</li>
			</ul>
		</div>
		</nav> </header>
