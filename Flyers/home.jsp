<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.DealMatches"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.LinkedList"%>
<%@page import="pojo.FlightList"%>
<%@page import="pojo.Flight"%>
<%@page import="pojo.Route"%>
<%@page import="model.MySqlDataStoreUtilities"%>
<jsp:include page="header.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper no-margin cover">
	<!-- Main content -->
	<section class="content welcome-message" id="book">
		<center class="welcome-label">
			<h3>Plan Your Trip With US.</h3>
		</center>
	</section>
	<section class="content booking">
		<div class="booking-block">
			<form action="/Flyers/FlightSearch" method="get" id="homeForm"
				onsubmit="return validateEmptyFields(this)">
				<div class="row">
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<div class="radio">
									<input type="radio" name="trip" id="optionsRadios1" value="rt"
										checked="checked" onclick="handleTripType(this)"> <label> Round-Trip </label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<div class="radio">
									<input type="radio" name="trip" id="optionsRadios1" value="ow" onclick="handleTripType(this)">
									<label> One-Way </label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<label>Departure</label>
								<div class="input-group source">
									<div class="input-group-addon">
										<i class="fa fa-plane"></i>
									</div>
									<input class="form-control input-lg" type="text" id="departuerText"
										name="departuer" placeholder="Departure">
								</div>
								<span style="color:red" id="departuerErr"></span>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<label>Arrival</label>
								<div class="input-group source">
									<div class="input-group-addon">
										<i class="fa fa-plane"></i>
									</div>
									<input class="form-control input-lg" type="text" name="arrival" id = "arrivalText"
										placeholder="Arrival">
								</div>
								<span style="color:red" id="arrivalErr"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<label>Departure Date</label>
								<div class="input-group source">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input class="form-control input-lg" type="date" name="ddate" id="dDateText"
										placeholder="Arrival">
								</div>
								<span style="color:red" id="dDateErr"></span>
							</div>
						</div>
					</div>
					<div class="col-md-6" id="rdateDiv"	>
						<div class="box-body">
							<div class="form-group">
								<label>Return Date</label>
								<div class="input-group source">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input class="form-control input-lg" type="date" name="rdate" id="rdate"
										placeholder="Arrival">
								</div>
								<span style="color:red" id="rdateErr"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<label>Cabin Class</label>
								<div class="input-group source">
									<div class="input-group-addon">
										<i class="fa fa-plane"></i>
									</div>
									<select class="form-control input-lg" name="cabinclass">
										<option value="0">Economy</option>
										<option value="1">First</option>
										<option value="2">Business</option>
									</select>
								</div>
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="box-body">
							<div class="form-group">
								<label>No. of Passanger</label>
								<div class="input-group source">
									<div class="input-group-addon">
										<i class="fa fa-user"></i>
									</div>
									<input class="form-control input-lg" type="number" value="1" id="nopText"
										name="nop" placeholder="No. of Passanger">
								</div>
								<span style="color:red" id="nopErr"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="box-body">
							<div class="form-group">
								<label> &nbsp;</label>
								<button type="submit" class="btn btn-info input-lg go">
									<i class="fa fa-arrow-circle-right fa-3x"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="box-body">
							<div class="form-group">
								<h2>We beat our competitors in all aspects.</h2>
								<h2>Price Match Guaranteed !</h2>
								<%
									HashMap<String, Route> selectedRoutes;
									ArrayList<String> tweets;
									DealMatches dealMatches = new DealMatches();

									selectedRoutes = dealMatches.getSelectedRoutesFromTweets();
									tweets = dealMatches.getTweets();
									if (tweets.isEmpty()) {
								%>
								<p style="color: #325b9e">No Offers Found !</p>
								<%
									} else {
										for (String tweet : tweets) {
								%>
								<p style="color: #325b9e"><%=tweet%></p>
								<%
									}
									}
								%>
							</div>
						</div>
					</div>
				</div>



			</form>
		</div>
	</section>
	<!-- </section> -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%
	if (MySqlDataStoreUtilities.allTravelFlights.size() > 0) {
		LinkedList<FlightList> myTravel = MySqlDataStoreUtilities.allTravelFlights;
		MySqlDataStoreUtilities.loadPrimry();
%>
<div class="content-wrapper full-width">
	<section class="content next-block" id="help">
		<div class="box">
			<h3>
				<center>Popular in Your State</center>
			</h3>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<%
						DateFormat dayFormat = new SimpleDateFormat("MMM dd, yyyy");
							DecimalFormat df = new DecimalFormat(".##");
							for (int i = 0; i < myTravel.size(); i += 3) {
								if (i == 0) {
					%>
					<div class="item active">
						<%
							} else {
						%>
						<div class="item">
							<%
								}
							%>
							<div class="box-body">
								<%
									for (int j = i; j < (i + 3); j++) {
												if (j < myTravel.size()) {
													Flight f1;
													FlightList fl = myTravel.get(j);
													LinkedList<Flight> flight = fl.getFlights();
													String time;
													String departure, arrival;
													f1 = flight.get(0);
													time = dayFormat.format(new Date(f1.getFlightdate()));
													departure = f1.getRoute().getAirport();
													arrival = f1.getRoute().getDestination();
													double fare = fl.getFareeconomy();
								%>
								<div class="col-xs-4">
									<div class="">
										<img src="images/carousel_<%=(j % 5 + 1)%>.jpg" alt="IMG">
									</div>
									<table
										style="width: 78%; margin-left: 10px; text-align: center; margin-right: 20px;">
										<tr>
											<td colspan="2">
												<h2>
													<%=departure%>
													to
													<%=arrival%>
												</h2>
											</td>
										</tr>
										<tr>
											<td colspan="2"><label> Date:</label> <%=time%></td>
										</tr>
										<tr>
											<td>
												<h3>
													<b> $<%=fare%></b>
												</h3>
											</td>
											<td style="text-align: right; float: right;"><a
												href="/Flyers/bookticket.jsp?flight=<%=j%>&nop=<%=1%>&cabin=<%=0%>&trip=ow"
												class="btn btn-primary btn-lg">Book</a></td>
										</tr>
									</table>
								</div>
								<%
									} else {
													break;
												}
											}
								%>
							</div>
						</div>
						<%
							}
						%>
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
	</section>
</div>
<%
	}
%>
<section class="content next-block">
	<div class="box">
		<table class="section-table">
			<tr>
				<td>
					<h2>Start your travel planning with us</h2>
				</td>
			</tr>
			<tr>
				<td>
					<h4>Search cheap flights and book it quickly.</h4>
				</td>
			</tr>
		</table>
		<div class="row row-block">
			<div class="col-md-4 myhover">
				<table class="section-table">
					<tr>
						<td><img src="images/icon_1.png" alt=""></td>
					</tr>
					<tr>
						<td>
							<h2>Register</h2>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-4 myhover">
				<table class="section-table">
					<tr>
						<td><img src="images/icon_2.png" alt=""></td>
					</tr>
					<tr>
						<td>
							<h2>Explore</h2>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-4 myhover">
				<table class="section-table">
					<tr>
						<td><img src="images/icon_3.png" alt=""></td>
					</tr>
					<tr>
						<td>
							<h2>Fly</h2>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	$('.myCarousel').carousel()
</script>
<script type="text/javascript" src="scripts/formValidator.js">
