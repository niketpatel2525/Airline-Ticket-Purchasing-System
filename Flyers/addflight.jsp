<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<%@ page import="model.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%
	LinkedHashMap<Integer, String> flights;
	MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
	flights = msdsu.getFlights();
%>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Add Flight</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=addflight" method="post" onsubmit="return validateEmptyFields(this)" id="addUpdateFlightForm">
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Departure Date & Time</label>
								<input type="date" name="departuredate" class="form-control">
								<span style="color:red"></span>
								<input type="time" name="departuretime" class="form-control">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Arrival Date & Time</label>
								<input type="date" class="form-control" name="arrivaldate">
								<span style="color:red"></span>
								<input type="time" class="form-control" name="arrivaltime">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputEmail1">Economy Class Fare</label>
								<input type="text" name="fareeconomy" class="form-control" id="exampleInputEmail1" placeholder="Economy Class Fare">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">First Class Fare</label>
								<input type="text" name="farefirst" class="form-control" id="exampleInputPassword1" placeholder="First Class Fare">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">Business Class Fare</label>
								<input type="text" name="farebusiness" class="form-control" id="exampleInputPassword1" placeholder="Business Class Fare">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputEmail1">Aircraft</label>
								<select class="form-control select2" style="width: 100%;" name="aircraft" required="required">
									<option selected="selected">Choose Aircraft</option>
									<option value="1">Boing 777</option>
								</select>
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">Route</label>
								<select class="form-control select2" name="route" style="width: 100%;" name="utype" required="required">
									<option selected="selected">Choose Route</option>
									<%
									for (Map.Entry<Integer, String> m : flights.entrySet()) {
										int id = m.getKey();
										String path = m.getValue();
									%>

									<option value="<%=id%>"><%=path%></option>
									<%
										}
									%>
								</select>
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputEmail1">Current Delay</label>
								<input type="text" name="delay" class="form-control" id="exampleInputEmail1" value="0" placeholder="Delay in Minutes i.e. 10">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Baggage Allowance</label>
								<input type="text" name="bagallow" class="form-control" id="exampleInputEmail1" placeholder="No. of Bag">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Extra Baggage Fare per 50lb Bag</label>
								<input type="text" name="extrabag" class="form-control" id="exampleInputPassword1" placeholder="Cost">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Wifi Available</label>
								<select class="form-control select2" style="width: 100%;" name="wifi">
									<option value="1" selected="selected">Yes</option>
									<option value="0">No</option>
								</select>
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Cancellation/Rescheduling Charge</label>
								<input type="text" name="cancellationcost" class="form-control" id="exampleInputPassword1" placeholder="Cost">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Add Flight" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
