<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.MySqlDataStoreUtilities"%>
<%@page import="pojo.FlightList"%>
<%@page import="model.Error"%>
<%@page import="java.util.*"%>
<%@page import="pojo.User"%>

<%
	session = request.getSession(false);

	if (session.getAttribute("user") == null) {
		response.sendRedirect("/Flyers/signin.jsp");
		return;
	}
%>
<jsp:include page="header.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
            $(document).on("click", "#btn", function() {
               var promoCode = document.getElementById("promo").value;
               if(promoCode == "" ||(promoCode != "20OFF" && promoCode != "GROUPOFF" && promoCode != "AIRINDIA20" && promoCode != "NEWUSER"))
               {
               		alert("Enter a valid Promo Code");
               }
               else
               {
                var params = {
    					promo: promoCode,
    			};
                $.get("CheckPromo", $.param(params),function(responseText) {

                    //$("#somediv").text(responseText);
                	if(responseText == "")
                	{
                		var code = document.getElementById("promo").value;
  						var fare = parseFloat(document.getElementById("totalfareamount").value);
  						var btn = document.getElementById("btn").value;
  						var original = document.getElementById("originalfare").value;

 						if(btn == "Apply")
 						 {
  							if(code == "NEWUSER")
  							{
  								$("#totalfareamount").val(fare * 0.90);
  								$("#btn").val("Remove Code");
  							}

  							else if(code == "20OFF")
  							{
  								$("#totalfareamount").val(fare * 0.80);
  								$("#btn").val("Remove Code");
  							}
  							else if(code == "GROUPOFF")
  							{
  								$("#totalfareamount").val(fare * 0.90);
  								$("#btn").val("Remove Code");
  							}
  							else if(code == "AIRINDIA20")
  							{
  								$("#totalfareamount").val(fare * 0.80);
  								$("#btn").val("Remove Code");
  							}

  							$("#promo").prop('disabled', true);
 						 }
  						else if(btn == "Remove Code")
  						{
  							$("#totalfareamount").val(original);
  							$("#promo").val("");
  							$("#btn").val("Apply");
  							$("#promo").prop('disabled', false);
 						 }
                	}
                	else
                	{
                		alert(responseText);
                	}
                });
                }
            });
 </script>


<div class="content-wrapper no-margin">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">You are flying with</h3>
			</div>
			<%
				int flightid, nop, cabin;
				String trip = "";
				if ((request.getParameter("flight") != null) && (request.getParameter("nop") != null)
						&& (request.getParameter("cabin") != null) && (request.getParameter("trip") != null)) {
					flightid = Integer.parseInt(request.getParameter("flight"));
					nop = Integer.parseInt(request.getParameter("nop"));
					cabin = Integer.parseInt(request.getParameter("cabin"));
					trip = request.getParameter("trip");
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("error.jsp?errorcode=" + Error.NO_DATA);
					rd.forward(request, response);
					return;
				}

				FlightList fl = MySqlDataStoreUtilities.getFlightList(flightid);
				String header1 = "", header2 = "", header3 = "", header4 = "", header5 = "";

				double fare = (cabin == 0) ? fl.getFareeconomy()
						: ((cabin == 1) ? fl.getFarefirst() : (cabin == 2) ? fl.getFarebusiness() : 0);
				DecimalFormat df = new DecimalFormat(".##");
				DateFormat dayFormat = new SimpleDateFormat("MMM dd, yyyy");

				header3 = "Departure Date: " + dayFormat.format(new Date(fl.getFlights().get(0).getFlightdate()));
				header5 = "Your Ticket Cost: $" + df.format(fare);

				String cabinclass = (cabin == 0) ? "Economy class"
						: (cabin == 1) ? "First class" : (cabin == 2) ? "Business class" : "";
				switch (fl.getFlights().size()) {
				case 1:

					header1 = fl.getFlights().get(0).getRoute().getAirport() + " to "
							+ fl.getFlights().get(0).getRoute().getDestination();
					header2 = fl.getAirline().getAirlinename() + ", One-Way, " + cabinclass + ", " + nop + " passanger";
					break;
				case 2:
					if (trip.equalsIgnoreCase("rt")) {
						header1 = fl.getFlights().get(0).getRoute().getAirport() + " to "
								+ fl.getFlights().get(0).getRoute().getDestination() + " , "
								+ fl.getFlights().get(1).getRoute().getAirport() + " to "
								+ fl.getFlights().get(1).getRoute().getDestination();
						header2 = fl.getAirline().getAirlinename() + ", Return Trip, " + cabinclass + ", " + nop
								+ " passanger";
						header4 = "Return Date: " + dayFormat.format(new Date(fl.getFlights().get(1).getFlightdate()));
					} else if (trip.equalsIgnoreCase("ow")) {
						header1 = fl.getFlights().get(0).getRoute().getAirport() + " to "
								+ fl.getFlights().get(1).getRoute().getDestination();
						header2 = fl.getAirline().getAirlinename() + ", One-Way, " + cabinclass + ", " + nop + " passanger";
						header4 = "Connecting Flight Date: "
								+ dayFormat.format(new Date(fl.getFlights().get(1).getFlightdate()));
					}
					break;
				case 4:
					header1 = fl.getFlights().get(0).getRoute().getAirport() + " to "
							+ fl.getFlights().get(0).getRoute().getDestination() + " , "
							+ fl.getFlights().get(2).getRoute().getAirport() + " to "
							+ fl.getFlights().get(2).getRoute().getDestination();
					header2 = fl.getAirline().getAirlinename() + ", Return Trip, " + cabinclass + ", " + nop + " passanger";
					header4 = "Return Date: " + dayFormat.format(new Date(fl.getFlights().get(2).getFlightdate()));
					break;
				}
			%>
			<div class="box-body">
				<b><%=header1%></b>
				<p><%=header2%></p>
				<p><%=header3%></p>
				<p><%=header4%></p>
				<b><%=header5%></b>
			</div>
		</div>
	</section>
	<form action="/Flyers/FlightServlet?code=bookticket" method="post">
		<input type="hidden" name="nop" value="<%=nop%>">
		<input type="hidden" name="flightid" value="<%=flightid%>">
		<input type="hidden" name="cabin" value="<%=cabin%>">
		<%
			for (int i = 0; i < nop; i++) {
		%>
		<section class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">
						Enter Passenger-<%=(i + 1)%>
						Details
					</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Passenger Name</label>
								<input type="text" name="pname<%=i%>" class="form-control" id="exampleInputEmail1" placeholder="Name of Passanger">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Gender</label>
								<select class="form-control select2" style="width: 100%;" name="gender<%=i%>">
									<option selected="selected">Choose Gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Age</label>
								<input type="number" name="age<%=i%>" class="form-control" id="exampleInputEmail1" placeholder="Your Age">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Passport No.</label>
								<input type="text" name="passport<%=i%>" class="form-control" id="exampleInputEmail1" placeholder="Your Passport No.">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Nationality</label>
								<input type="text" name="nationality<%=i%>" class="form-control" id="exampleInputPassword1" placeholder="Nationality">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Contact No.</label>
								<input type="text" name="cno<%=i%>" class="form-control" id="exampleInputEmail1" placeholder="Contact No.">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Address</label>
								<input type="text" name="addr<%=i%>" class="form-control" id="exampleInputPassword1" placeholder="Address">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputPassword1">Frequent Flyer Number</label>
								<input type="text" name="ffn<%=i%>" class="form-control" id="exampleInputPassword1" placeholder="Frequent Flyer Number">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%
			}
		%>
		<section class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">Enter Billing Details</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Name on Card</label>
								<input type="text" name="ccname" class="form-control" id="exampleInputEmail1" placeholder="Name on Card">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Card Number</label>
								<input type="text" name="ccnumber" class="form-control" id="exampleInputEmail1" placeholder="Card Number">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group" id="code">
								<label for="exampleInputPassword1">Promo</label>
								<input type="text" name="promo" class="form-control input-lg" id="promo" placeholder="Enter Your Promocode">
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="exampleInputPassword1">&nbsp;</label>
								<input type="button" id="btn" value="Apply" class="btn btn-block btn-success input-lg">
							</div>

						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="exampleInputPassword1">Total Cost: <small>(in $)</small></label>
								<input type="text" style="border:none" name = "totalfareamount" value = "<%=fare%>" id="totalfareamount" readonly="true" class="form-control input-lg">
								<input type="hidden" name = "originalfare" value = "<%=fare%>" id="originalfare">

						</div></div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Book Flight" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
