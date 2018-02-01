<%@page import="java.util.Date"%>
<%@page import="model.Error"%>
<%@page import="pojo.FlightSchedule"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<%
	FlightSchedule fs = null;
	if (request.getAttribute("flight") != null) {
		fs = (FlightSchedule) request.getAttribute("flight");

	} else {
		response.sendRedirect("/Flyers/error.jsp?errorcode=" + Error.NO_DATA);
	}

	Date dd = new Date(fs.getFlightdate());
	Date ad = new Date(fs.getArrivaldate());
%>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Update Flight</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=updateflight" method="post">
				<input type="hidden" name="fsid" value="<%=fs.getFsid()%>">
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Departure Date & Time</label>
								<input type="text" name="departuredate" class="form-control" value="<%=dd.toLocaleString()%>" disabled="disabled">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Arrival Date & Time</label>
								<input type="text" class="form-control" name="arrivaldate" value="<%=ad.toLocaleString()%>" disabled="disabled">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Economy Class Fare</label>
								<input type="text" name="fareeconomy" class="form-control" id="exampleInputEmail1" value="<%=fs.getFareeconomy()%>" placeholder="Economy Class Fare">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">First Class Fare</label>
								<input type="text" name="farefirst" class="form-control" id="exampleInputPassword1" placeholder="First Class Fare" value="<%=fs.getFarefirst()%>">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Business Class Fare</label>
								<input type="text" name="farebusiness" class="form-control" id="exampleInputPassword1" placeholder="Business Class Fare" value="<%=fs.getFarebusiness()%>">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Current Delay</label>
								<input type="text" name="delay" class="form-control" id="exampleInputEmail1" value="0" placeholder="Delay in Minutes i.e. 10">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Baggage Allowance</label>
								<input type="text" name="bagallow" class="form-control" id="exampleInputEmail1" placeholder="No. of Bag" value="<%=fs.getBagallow()%>">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Extra Baggage Fare per 50lb Bag</label>
								<input type="text" name="extrabag" class="form-control" id="exampleInputPassword1" placeholder="Cost" value="<%=fs.getExtrabagfare()%>">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Wifi Available</label>
								<select class="form-control select2" style="width: 100%;" name="wifi">
									<%
										if (fs.getWifi() == 1) {
									%>
									<option value="1" selected="selected">Yes</option>
									<%
										} else {
									%>
									<option value="1">Yes</option>
									<%
										}
										if (fs.getWifi() == 0) {
									%>
									<option value="0" selected="selected">No</option>
									<%
										} else {
									%>
									<option value="0">No</option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Cancellation/Rescheduling Charge</label>
								<input type="text" name="cancellationcost" class="form-control" id="exampleInputPassword1" placeholder="Cost" value="<%=fs.getCancellationcharge()%>">
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Update Flight" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>