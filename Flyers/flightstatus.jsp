<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pojo.FlightSchedule"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Flight Schedule</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=flightschedule" method="post" onsubmit="return validateEmptyFields(this)" id="flightStatusForm">
				<div class="box-body">
					<div class="row row-form">
						<div class="col-md-12">
							<div class="box-body">
								<div class="form-group">
									<label>Departure Date</label>
									<div class="input-group source">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input class="form-control input-lg" type="date" name="departuer" placeholder="Departure">
										<span style="color:red"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="box-body">
								<div class="form-group">
									<label>Flight Number</label>
									<div class="input-group source">
										<div class="input-group-addon">
											<i class="fa fa-plane"></i>
										</div>
										<input class="form-control input-lg" type="text" name="flightid" placeholder="Flight id">
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
		if (request.getAttribute("flightschedule") != null) {
			FlightSchedule fs = (FlightSchedule) request.getAttribute("flightschedule");
			DateFormat date = new SimpleDateFormat("MMM dd, yyyy HH:mm");
			

			String flightdate = date.format(new Date(fs.getFlightdate()));
			String arrdate = date.format(new Date(fs.getArrivaldate()));
			String estimatedflightdate = date.format(new Date(fs.getEstimatedFlightDate()));
			String estimatedarrdate = date.format(new Date(fs.getEstimatedArrivalDate()));
			int delay = fs.getTimeoffset();
	%>
	<section class="content next-block">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Flight Schedule</h3>
			</div>
			<div class="box-body">
				<div class="row row-form-info">
					<table>
						<tr>
							<td class="right-text">
								<label>Departure Date & Time:&nbsp</label>
							</td>
							<td class="left-text"><%=flightdate%></td>
						</tr>
						<tr>
							<td class="right-text">
								<label>Arrival Date & Time:&nbsp</label>
							</td>
							<td class="left-text"><%=arrdate%></td>
						</tr>
						<tr>
							<td class="right-text">
								<label>Delay in min. :&nbsp</label>
							</td>
							<td class="left-text"><%=delay%> mins</td>
						</tr>
						<tr>
							<td class="right-text">
								<label>Estimated Departure Date & Time:&nbsp</label>
							</td>
							<td class="left-text"><%=estimatedflightdate%></td>
						</tr>
						<tr>
							<td class="right-text">
								<label>Estimated Arrival Date & Time:&nbsp</label>
							</td>
							<td class="left-text"><%=estimatedarrdate%></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>
</div>
<jsp:include page="footer.jsp"></jsp:include>