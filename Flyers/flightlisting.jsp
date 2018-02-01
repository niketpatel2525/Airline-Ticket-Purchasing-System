<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Error"%>
<%@page import="pojo.*"%>
<%@page import="model.*"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Available Flights</h3>
				<small> <%
 	if (request.getAttribute("flightDetail") != null)
 		out.print(request.getAttribute("flightDetail"));
 %>
				</small>
			</div>
		</div>
		<%
			if (request.getAttribute("flightList") == null) {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp?errorcode=" + Error.NO_DATA);
				rd.forward(request, response);
				return;
			}
			int cabin = Integer.parseInt(request.getParameter("cabin"));
			String trip = request.getParameter("trip");
			LinkedList<FlightList> flights = (LinkedList<FlightList>) request.getAttribute("flightList");
			DateFormat dateFormat = new SimpleDateFormat("HH:mm");
			DateFormat dayFormat = new SimpleDateFormat("MMM dd, yyyy");
			DecimalFormat df = new DecimalFormat(".##");

			if (flights == null || flights.size() == 0) {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp?errorcode=" + Error.NO_DATA);
				rd.forward(request, response);
				return;
			}
			int count = 0;
			for (FlightList fl : flights) {
				LinkedList<Flight> flight = fl.getFlights();
				Flight f1, f2, f3, f4;
				String time;
				String departure, arrival;
				double fare = (cabin == 0) ? fl.getFareeconomy()
						: ((cabin == 1) ? fl.getFarefirst() : (cabin == 2) ? fl.getFarebusiness() : 0);

				switch (flight.size()) {
				case 1:
		%>
		<div class="box box-body">
			<div class="row lspace flight-box">
				<div class="col-md-8">
					<div class="row lspace">
						<%
							f1 = flight.get(0);
									time = dateFormat.format(new Date(f1.getFlightdate()));
									departure = f1.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f1.getFlightdate()))%>
									</td>
								</tr>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f1.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%>
								</h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f1.getArrivaldate()));
												arrival = f1.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row lspace">
						<table>
							<tr>
								<td>
									<h3>
										$<%=df.format(fare)%>
									</h3>
								</td>
							</tr>
							<tr>
								<td>
									<a href="/Flyers/bookticket.jsp?flight=<%=count%>&nop=<%=request.getParameter("nop")%>&cabin=<%=cabin%>&trip=<%=trip%>" class="btn btn-primary"> View Deal</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%
			break;
				case 2:
		%>
		<div class="box box-body">
			<div class="row lspace flight-box">
				<div class="col-md-8">
					<div class="row lspace">
						<%
							f1 = flight.get(0);
									time = dateFormat.format(new Date(f1.getFlightdate()));
									departure = f1.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f1.getFlightdate()))%>
									</td>
								</tr>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f1.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%>
								</h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f1.getArrivaldate()));
												arrival = f1.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%>
								</h4>
							</div>
						</div>
					</div>
					<div class="row lspace">
						<%
							f2 = flight.get(1);
									time = dateFormat.format(new Date(f2.getFlightdate()));
									departure = f2.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f2.getFlightdate()))%>
									</td>
								</tr>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f2.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%>
								</h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f2.getArrivaldate()));
												arrival = f2.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row lspace">
						<table>
							<tr>
								<td class="">
									<h3>
										$<%=df.format(fare)%></h3>
								</td>
							</tr>
							<tr>
								<td>
									<a href="/Flyers/bookticket.jsp?flight=<%=count%>&nop=<%=request.getParameter("nop")%>&cabin=<%=cabin%>&trip=<%=trip%>" class="btn btn-primary"> View Deal</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%
			break;
				case 4:
		%>
		<div class="box box-body">
			<div class="row lspace flight-box">
				<div class="col-md-8">
					<div class="row lspace">
						<%
							f1 = flight.get(0);
									time = dateFormat.format(new Date(f1.getFlightdate()));
									departure = f1.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f1.getFlightdate()))%>
									</td>
								</tr>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f1.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%>
								</h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f1.getArrivaldate()));
												arrival = f1.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%>
								</h4>
							</div>
						</div>
					</div>
					<div class="row lspace">
						<%
							f2 = flight.get(1);
									time = dateFormat.format(new Date(f2.getFlightdate()));
									departure = f2.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f2.getFlightdate()))%>
									</td>
								</tr>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f2.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%></h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f2.getArrivaldate()));
												arrival = f2.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%></h4>
							</div>
						</div>
					</div>
					<div class="row lspace">
						<%
							f3 = flight.get(2);
									time = dateFormat.format(new Date(f3.getFlightdate()));
									departure = f3.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f3.getFlightdate()))%>
									</td>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f3.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%></h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f3.getArrivaldate()));
												arrival = f3.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%></h4>
							</div>
						</div>
					</div>
					<div class="row lspace">
						<%
							f4 = flight.get(3);
									time = dateFormat.format(new Date(f4.getFlightdate()));
									departure = f4.getRoute().getAirport();
						%>
						<div class="col-sm-3 ">
							<table>
								<tr>
									<th>
										<h3 class="bg-green"><%=fl.getAirline().getAirlinename()%></h3>
									</th>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f4.getFlightdate()))%>
									</td>
								</tr>
								<tr>
									<td>to</td>
								</tr>
								<tr>
									<td>
										<%=dayFormat.format(new Date(f4.getArrivaldate()))%>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-3">
							<div class="pull-right">
								<h4>
									<%=time%>
									<%=departure%></h4>
							</div>
						</div>
						<div class="col-sm-3">
							<hr class="bg-hr">
						</div>
						<div class="col-sm-3">
							<div class="pull-left">
								<h4>
									<%
										time = dateFormat.format(new Date(f4.getArrivaldate()));
												arrival = f4.getRoute().getDestination();
									%>
									<%=time%>
									<%=arrival%></h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row lspace">
						<table>
							<tr>
								<td class="">
									<h3>
										$<%=df.format(fare)%></h3>
								</td>
							</tr>
							<tr>
								<td>
									<a href="/Flyers/bookticket.jsp?flight=<%=count%>&nop=<%=request.getParameter("nop")%>&cabin=<%=cabin%>&trip=<%=trip%>" class="btn btn-primary"> View Deal</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%
			break;
				}
				count++;
		%>
		<%
			}
		%>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>