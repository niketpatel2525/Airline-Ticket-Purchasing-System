<%@page import="model.Error"%>
<%@page import="pojo.User"%>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<%
			session = request.getSession(false);
			User user = (User) session.getAttribute("user");
		%>
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			<li class="active treeview">
				<a href="#">
					<i class="fa fa-dashboard"></i> <span>Home</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/home.jsp">
							<i class="fa fa-circle-o"></i> Home
						</a>
					</li>
					<%
						if (user != null && user.getUsertype() == 0) {
					%>
					<li>
						<a href="/Flyers/profile.jsp">
							<i class="fa fa-circle-o"></i> Profile
						</a>
					</li>
					<%
						} else if (user != null && user.getUsertype() == 2) {
					%>
					<li>
						<a href="/Flyers/aboutairline.jsp">
							<i class="fa fa-circle-o"></i> About Your Airline
						</a>
					</li>
					<%
						} else if (user != null && user.getUsertype() == 1) {
					%>
					<li>
						<a href="/Flyers/profile.jsp">
							<i class="fa fa-circle-o"></i> Profile
						</a>
					</li>
					<li>
						<a href="/Flyers/registration.jsp">
							<i class="fa fa-circle-o"></i> Register New User
						</a>
					</li>
					<%
						}
					%>
				</ul>
			</li>
			<%
				if (user != null && user.getUsertype() == 0) {
			%>
			<li class="treeview active">
				<a href="#">
					<i class="fa fa-plane"></i> <span>Flights</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/flightstatus.jsp">
							<i class="fa fa-circle-o"></i> Check Flight Status
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview active">
				<a href="#">
					<i class="fa fa-edit"></i> <span>Your Trips</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/findMyTicket.jsp">
							<i class="fa fa-circle-o"></i> Your Tickets
						</a>
					</li>
					<li>
						<a href="/Flyers/findMyTicket.jsp">
							<i class="fa fa-circle-o"></i> Update Your Ticket
						</a>
					</li>
				</ul>
			</li>
			<%
				} else if (user != null && user.getUsertype() == 2) {
			%>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-files-o"></i> <span>Flights</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/addflight.jsp">
							<i class="fa fa-circle-o"></i> Add Flights
						</a>
					</li>
					<li>
						<a href="/Flyers/FlightServlet?code=mynextflights">
							<i class="fa fa-circle-o"></i> View Flights
						</a>
					</li>
					<li>
						<a href="/Flyers/FlightServlet?code=mynextflights">
							<i class="fa fa-circle-o"></i> Update Flights
						</a>
					</li>
					<li>
						<a href="/Flyers/flightstatus.jsp">
							<i class="fa fa-circle-o"></i> Check Flight Status
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview active">
				<a href="#">
					<i class="fa fa-edit"></i> <span>Reports</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/addoffers.jsp">
							<i class="fa fa-circle-o"></i> Add Offers
						</a>
					</li>
					<li>
						<a href="/Flyers/FlightServlet?code=salesreportbytable">
							<i class="fa fa-circle-o"></i> Sales Report
						</a>
					</li>
				</ul>
			</li>
			<%
				} else if (user != null && user.getUsertype() == 1) {
			%>
			<li class="treeview active">
				<a href="#">
					<i class="fa fa-files-o"></i> <span>Flights</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/addaircraft.jsp">
							<i class="fa fa-circle-o"></i> Add Aircraft
						</a>
					</li>
					<li>
						<a href="/Flyers/addroute.jsp">
							<i class="fa fa-circle-o"></i> Add Route
						</a>
					</li>
					<li>
						<a href="/Flyers/FlightServlet?code=mynextflights">
							<i class="fa fa-circle-o"></i> View Flights
						</a>
					</li>
					<li>
						<a href="/Flyers/flightstatus.jsp">
							<i class="fa fa-circle-o"></i> Check Flight Status
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview active">
				<a href="#">
					<i class="fa fa-edit"></i> <span>Customer's Trip</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/findMyTicket.jsp">
							<i class="fa fa-circle-o"></i> Search By Tickets
						</a>
					</li>
					<li>
						<a href="/Flyers/findMyTicket.jsp">
							<i class="fa fa-circle-o"></i> Update Ticket
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview active">
				<a href="#">
					<i class="fa fa-edit"></i> <span>Reports</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="/Flyers/addoffers.jsp">
							<i class="fa fa-circle-o"></i> Add Offers
						</a>
					</li>
					<li>
						<a href="/Flyers/FlightServlet?code=salesreportbytable">
							<i class="fa fa-circle-o"></i> Sales Report
						</a>
					</li>
					<li>
						<a href="/Flyers/reviewReport.jsp">
							<i class="fa fa-circle-o"></i> Review Report
						</a>
					</li>
					<li>
						<a href="/Flyers/FlightServlet?code=searchforairline">
							<i class="fa fa-circle-o"></i> Airline Page
						</a>
					</li>
				</ul>
			</li>
			<%
				}
			%>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
<%
	request.setAttribute("LEFTNAVFOOTER", true);
%>
