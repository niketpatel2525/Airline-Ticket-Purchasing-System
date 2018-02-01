<%@page import="java.util.LinkedList"%>
<%@page import="model.MySqlDataStoreUtilities"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<%
		String opt = "";
		int tsid = 0;
		int fsid = 0;
		int psid = 0;
		if ((request.getParameter("option") != null) && (request.getParameter("tsid") != null)
				&& (request.getParameter("fsid") != null) && (request.getParameter("psid") != null)) {
			opt = (String) request.getParameter("option");
			tsid = Integer.parseInt(request.getParameter("tsid"));
			fsid = Integer.parseInt(request.getParameter("fsid"));
			psid = Integer.parseInt(request.getParameter("psid"));
		}
		if (opt.equalsIgnoreCase("food")) {
	%>
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Select Food</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=food" method="post">
				<input type="hidden" name="tsid" value="<%=tsid%>">
				<input type="hidden" name="fsid" value="<%=fsid%>">
				<input type="hidden" name="psid" value="<%=psid%>">
				<div class="box-body">
					<div class="row row-form">
						<div class="col-md-12">
							<div class="box-body">
								<div class="form-group">
									<label>Food Options</label>
									<div class="input-group source">
										<div class="input-group-addon">
											<i class="fa fa-cutlery"></i>
										</div>
										<select class="form-control select2" name="food" style="width: 100%;" name="utype" required="required">
											<option selected="selected">Choose Food option</option>
											<option value="Asian Veg Meal">Asian Veg Meal</option>
											<option value="Hindu Meal (Non-veg)">Hindu Meal (Non-veg)</option>
											<option value="Kosher Meal">Kosher Meal</option>
											<option value="Jain Meal">Jain Meal</option>
											<option value="Vegetarian Meal">Vegetarian Meal</option>
											<option value="Moslem Meal">Moslem Meal</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class=" col-md-offset-1 col-md-10">
							<div class="box-body">
								<div class="form-group">
									<input type="submit" value="Submit" class="btn btn-block btn-primary btn-lg">
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<hr>
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<table class="justify-table">
							<tr>
								<th>Meal</th>
								<th>Description</th>
							</tr>
							<tr>
								<th>Asian Veg Meal</th>
								<td>
									<p>Contains vegetables, fresh fruits and dairy products. Does not contain any meat, fish or eggs. Mildly spicy to spicy. Prepared according to subcontinent taste (mildly spicy to spicy).</p>
								</td>
							</tr>
							<tr>
								<th>Hindu Meal (Non-veg)</th>
								<td>
									<p>Contains meat (lamb or chicken), fish, eggs and dairy products. Does not contain any beef/pork or its products. Mildly spicy to spicy. Incorporates flavors of Indian sub continent.</p>
								</td>
							</tr>
							<tr>
								<th>
									Kosher Meal <small>Requires 72 hours prior notice</small>
								</th>
								<td>
									<p>Prepared to comply with Jewish dietary requirements. Certified in the kosher kitchen. (Available only on International Flights)</p>
								</td>
							</tr>
							<tr>
								<th>Jain Meal</th>
								<td>
									<p>This meal is for members of Jain Community. Does NOT contain animal products & by-products and root vegetables like potatoes, carrot, onion, garlic etc.</p>
								</td>
							</tr>
							<tr>
								<th>Vegetarian Meals</th>
								<td>
									<p>Contains all types of fruits and vegetables. Does not contain any meat, fish or eggs.</p>
								</td>
							</tr>
							<tr>
								<th>Moslem Meal</th>
								<td>
									<p>All non-vegetarian meals are suitable for Muslims and are prepared in accordance with Halal method. May contain lamb, chicken, fish, eggs, fruits & dairy products. It does NOT contain pork or non-halal prepared meats.</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>
	<%
		if (opt.equalsIgnoreCase("wheel")) {
	%>
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Select Wheel Chair Option</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=wheel" method="post">
				<input type="hidden" name="tsid" value="<%=tsid%>">
				<input type="hidden" name="fsid" value="<%=fsid%>">
				<input type="hidden" name="psid" value="<%=psid%>">
				<div class="box-body">
					<div class="row row-form">
						<div class="col-md-12">
							<div class="box-body">
								<div class="form-group">
									<label>Wheel Chair Options</label>
									<div class="input-group source">
										<div class="input-group-addon">
											<i class="fa fa-wheelchair"></i>
										</div>
										<select class="form-control select2" name="wheel" style="width: 100%;" name="utype" required="required">
											<option selected="selected">Choose Wheel Chair option</option>
											<option value="0">No</option>
											<option value="1">Yes</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class=" col-md-offset-1 col-md-10">
							<div class="box-body">
								<div class="form-group">
									<input type="submit" value="Submit" class="btn btn-block btn-primary btn-lg">
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<%
		}
	%>
	<%
		if (opt.equalsIgnoreCase("seat")) {
	%>
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Select Your Seat</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=seat" method="post">
				<input type="hidden" name="tsid" value="<%=tsid%>">
				<input type="hidden" name="fsid" value="<%=fsid%>">
				<input type="hidden" name="psid" value="<%=psid%>">
				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<img src="images/seatmap.jpg" alt="seatmap">
						</div>
					</div>
					<%
						MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
							LinkedList<Integer> seat = msdsu.findAllSeats(fsid);
					%>
					<div class="row row-form">
						<div class="col-md-12">
							<div class="box-body">
								<div class="form-group">
									<label>Seat Options</label>
									<div class="input-group source">
										<div class="input-group-addon">
											<i class="fa fa-user"></i>
										</div>
										<select class="form-control select2" name="seat" style="width: 100%;" name="utype" required="required">
											<option selected="selected">Choose Your Seat</option>
											<%
												for (int i = 0; i < seat.size(); i++) {
											%>
											<option value="<%=seat.get(i)%>"><%=seat.get(i)%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class=" col-md-offset-1 col-md-10">
							<div class="box-body">
								<div class="form-group">
									<input type="submit" value="Submit" class="btn btn-block btn-primary btn-lg">
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<%
		}
	%>
</div>
<jsp:include page="footer.jsp"></jsp:include>