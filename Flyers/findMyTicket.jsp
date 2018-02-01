<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pojo.Transaction"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Find Your Ticket</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=findMyTicket" method="post" onsubmit="return validateEmptyFields(this)" id="searchTicketForm">
				<div class="box-body">
					<div class="row row-form">
						<div class="col-md-12">
							<div class="box-body">
								<div class="form-group">
									<%
										if (request.getAttribute("msg") != null) {
											String msg = (String) request.getAttribute("msg");
									%>
									<p class="success"><%=msg%></p>
									<%
										}
									%>
									<label>Ticket Number</label>
									<div class="input-group source">
										<div class="input-group-addon">
											<i class="fa fa-plane"></i>
										</div>
										<input class="form-control input-lg" type="text" name="tsid" placeholder="Ticket Number">
										<span style="color:red"></span>
									</div>
								</div>
							</div>
						</div>
						<div class=" col-md-offset-1 col-md-10">
							<div class="box-body">
								<div class="form-group">
									<input type="submit" value="Search" class="btn btn-block btn-primary btn-lg">
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<%
		if (request.getAttribute("transactionlist") != null) {
			LinkedList<Transaction> tlist = (LinkedList<Transaction>) request.getAttribute("transactionlist");
			DateFormat date = new SimpleDateFormat("MMM dd, yyyy HH:mm");
			DecimalFormat df = new DecimalFormat(".##");
	%>
	<section class="content next-block">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Your Tickets</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-xs-6">
						<label> PNR:#</label>
						<%=tlist.get(0).getTsid()%>
					</div>
					<div class="col-xs-6">
						<label> Booking Date:</label>
						<%=date.format(new Date(tlist.get(0).getBookingdate()))%>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<label> Booked By:</label>
						<%=tlist.get(0).getUser().getUsername()%>
					</div>
					<%
						if (tlist.get(0).getOffer().getOffersid() != 0) {
					%>
					<div class="col-sm-4">
						<label>Offer ID:</label>
						<%=tlist.get(0).getOffer().getPromocode()%>
					</div>
					<%
						}
					%>
					<div class="col-sm-4">
						<label>Total:</label>
						$<%=df.format(tlist.get(0).getTotal())%>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label>Credit Card:</label>
						<%=tlist.get(0).getCreditcard()%>
					</div>
					<div class="col-md-6">
						<a href="/Flyers/FlightServlet?code=cancelticket&tsid=<%=tlist.get(0).getTsid()%>" class="btn btn-danger btn-lg">Cancel Ticket</a>
					</div>
				</div>
			</div>
			<hr>
			<div class="box-body">
				<div id="accordion" role="tablist">
					<%
						for (int i = 0; i < tlist.size(); i++) {
					%>
					<div class="card">
						<div class="card-header" role="tab" id="headingOne">
							<div class="row">
								<div class="col-md-3">
									<h5 class="mb-0">
										<a data-toggle="collapse" href="#collapseOne<%=i%>" aria-expanded="true" aria-controls="collapseOne<%=i%>">
											Date:
											<%=date.format(new Date(tlist.get(i).getFlightschedule().getFlightdate()))%>
										</a>
									</h5>
								</div>
								<div class="col-md-3">
									<h5 class="mb-0">
										<a data-toggle="collapse" href="#collapseOne<%=i%>" aria-expanded="true" aria-controls="collapseOne<%=i%>">
											<%=tlist.get(i).getFlightschedule().getRoute().getAirport()%>
											&nbsp to &nbsp
											<%=tlist.get(i).getFlightschedule().getRoute().getDestination()%>
										</a>
									</h5>
								</div>
								<div class="col-md-3">
									<h5 class="mb-0">
										<a data-toggle="collapse" href="#collapseOne<%=i%>" aria-expanded="true" aria-controls="collapseOne<%=i%>">
											<%=tlist.get(i).getPassanger().getName()%>
										</a>
									</h5>
								</div>
								<div class="col-md-3">
									<h5 class="mb-0">
										<a data-toggle="collapse" href="#collapseOne<%=i%>" aria-expanded="true" aria-controls="collapseOne<%=i%>">
											<%=tlist.get(i).getFlightschedule().getAirline().getAirlinename()%>
										</a>
									</h5>
								</div>
							</div>
						</div>
						<%
							if (i == 0) {
						%>
						<div id="collapseOne<%=i%>" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
							<%
								} else {
							%>
							<div id="collapseOne<%=i%>" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
								<%
									}
								%>
								<div class="card-body">
									<div class="row">
										<div class="col-xs-6">
											<label>Departure Date:</label>
											<%=date.format(new Date(tlist.get(i).getFlightschedule().getFlightdate()))%>
										</div>
										<div class="col-xs-6">
											<label>Departure Airport:</label>
											<%=tlist.get(i).getFlightschedule().getRoute().getAirport()%>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-6">
											<label>Arrival Date:</label>
											<%=date.format(new Date(tlist.get(i).getFlightschedule().getArrivaldate()))%>
										</div>
										<div class="col-xs-6">
											<label>Arrival Airport:</label>
											<%=tlist.get(i).getFlightschedule().getRoute().getDestination()%>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-6">
											<label>Bag Allowance:</label>
											<%=tlist.get(i).getFlightschedule().getBagallow()%>
										</div>
										<div class="col-xs-6">
											<label>Wifi:</label>
											<%
												out.print((tlist.get(i).getFlightschedule().getWifi() == 0) ? "NO" : "YES");
											%>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<label class="btn-lg">Seat:</label>
											<%
												int seat = tlist.get(i).getSeatno();
														if (seat != 0) {
															out.print(seat);
														} else {
											%>
											<a href="selectFlightOptions.jsp?option=seat&tsid=<%=tlist.get(i).getTsid()%>&fsid=<%=tlist.get(i).getFlightschedule().getFsid()%>&psid=<%=tlist.get(i).getPassanger().getPsid()%>" class="btn btn-success">Select</a>
											<%
												}
											%>
										</div>
										<div class="col-xs-4">
											<label class="btn-lg">Wheel Chair:</label>
											<%
												int wheelchair = tlist.get(i).getWheelchair();
														if (wheelchair != 0) {
															out.print("Yes");
														} else {
											%>
											<a href="selectFlightOptions.jsp?option=wheel&tsid=<%=tlist.get(i).getTsid()%>&fsid=<%=tlist.get(i).getFlightschedule().getFsid()%>&psid=<%=tlist.get(i).getPassanger().getPsid()%>" class="btn btn-success">Select</a>
											<%
												}
											%>
										</div>
										<div class="col-xs-4">
											<label class="btn-lg">Food:</label>
											<%
												String food = tlist.get(i).getFood();
														if (food != null) {
															out.print(food);
														} else {
											%>
											<a href="selectFlightOptions.jsp?option=food&tsid=<%=tlist.get(i).getTsid()%>&fsid=<%=tlist.get(i).getFlightschedule().getFsid()%>&psid=<%=tlist.get(i).getPassanger().getPsid()%>" class="btn btn-success">Select</a>
											<%
												}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
	</section>
	<%
		}
	%>
</div>
<
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	$('.accordion').collapse();
</script>