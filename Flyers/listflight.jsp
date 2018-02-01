<%@page import="java.util.Date"%>
<%@page import="pojo.FlightSchedule"%>
<%@page import="java.util.LinkedList"%>
<%@page import="model.Error"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<%
	LinkedList<FlightSchedule> fs = null;
	if (request.getAttribute("myFlights") != null) {
		fs = (LinkedList<FlightSchedule>) request.getAttribute("myFlights");

	} else {
		response.sendRedirect("/Flyers/error.jsp?errorcode=" + Error.NO_DATA);
	}
%>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">View Upcoming Flights</h3>
			</div>
			<div class="box-body">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>FSID</th>
							<th>Departure</th>
							<th>Departure Date & Time</th>
							<th>Arrival</th>
							<th>Arrival Date & Time</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							for (FlightSchedule f : fs) {
								int id = f.getFsid();
								String departure = f.getRoute().getAirport();
								Date dd = new Date(f.getFlightdate());
								String arrival = f.getRoute().getDestination();
								Date ad = new Date(f.getArrivaldate());
						%>
						<tr>
							<td><%=id%></td>
							<td><%=departure%></td>
							<td><%=dd.toLocaleString()%></td>
							<td><%=arrival%></td>
							<td><%=ad.toLocaleString()%></td>
							<td>
								<a href="/Flyers/FlightServlet?code=updateform&fsid=<%=id%>" class="btn btn-primary">Update</a>
							</td>
							<td>
								<a href="/Flyers/FlightServlet?code=viewByFlight&fsid=<%=id%>" class="btn btn-primary">View</a>
							</td>
							<%
								}
							%>
						
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable({
			"ordering" : false
		});
	});
</script>