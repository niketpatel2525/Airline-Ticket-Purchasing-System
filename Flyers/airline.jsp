<%@page import="java.util.Date"%>
<%@page import="model.Error"%>
<%@page import="java.util.Map"%>
<%@page import="pojo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MongoDBDataStoreUtilities"%>
<%@page import="pojo.Airline"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<%
	Airline airline = null;
	if (request.getAttribute("airline") != null) {
		airline = (Airline) request.getAttribute("airline");
		String name = airline.getAirlinename();
		String img = airline.getImage();
		String desc = airline.getDescription();
%>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">
					Something About
					<%=name%></h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<img src="<%=img%>" alt="img" style="width: 100%; height: 80%" />
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12">
						<table class="justify-table">
							<tr>
								<td><%=desc%></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<hr>
			<div class="box-header with-border">
				<h3 class="box-title">Write Your Review</h3>
			</div>
			<%
				session = request.getSession(false);
					if (session.getAttribute("user") != null) {
			%>
			<form action="/Flyers/FlightServlet?code=addreview" method="post">
				<input type="hidden" name="airline" value="<%=name%>">
				<div class="box-body">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label>
								<input type="text" name="name" class="form-control" id="exampleInputEmail1" placeholder="Enter Your Name">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Flight Date</label>
								<input type="date" name="fdate" class="form-control" id="exampleInputEmail1" placeholder="Enter Your Name">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Route Detail</label>
								<input type="text" name="route" class="form-control" id="exampleInputEmail1" placeholder="Enter Route (i.e. ORD-AMD)">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInputEmail1">Your Country</label>
								<input type="text" name="country" class="form-control" id="exampleInputEmail1" placeholder="Enter Your Country">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="exampleInputEmail1">Review</label>
								<textarea name="review" class="textarea" placeholder="Write your review" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Ratings</label>
								<select class="form-control select2" name="rating" style="width: 100%;" name="utype">
									<option value="5">5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>&nbsp</label>
								<input type="submit" value="Submit" class="btn btn-block btn-primary">
							</div>
						</div>
					</div>
				</div>
			</form>
			<%
				} else {
			%>
			<div class="box-body">
				<center>
					<h3>
						<a href="/Flyers/signin.jsp">Sign in</a>
						to write Review
					</h3>
				</center>
			</div>
			<%
				}
			%>
			<hr>
			<div class="box-header with-border">
				<h3 class="box-title">Reviews</h3>
			</div>
			<%
				MongoDBDataStoreUtilities mdsu = new MongoDBDataStoreUtilities();
					HashMap<Integer, ArrayList<Review>> reviews = mdsu.readReview(name);
					for (Map.Entry<Integer, ArrayList<Review>> review : reviews.entrySet()) {
						int code = review.getKey();
						if (code != Error.SUCCESS) {
			%>
			<div class="box-body">
				<div class="row">
					<b>
						<center>No Review</center>
					</b>
				</div>
			</div>
			<%
				} else {

							ArrayList<Review> rs = review.getValue();
			%>
			<div class="box-body">
				<%
					for (Review r : rs) {
									Date d = new Date(r.getDate());
				%>
				<div class="row">
					<div class="col-xs-12">
						<blockquote>
							<p>
								<%
									for (int i = 0; i < r.getRating(); i++) {
								%>
								<i class="fa fa-star" aria-hidden="true"></i>
								<%
									}
								%>
							</p>
							<p>
								<%=r.getReview()%>
							</p>
							<footer>
								<%=r.getName()%>
								, &nbsp
								<%=r.getCountry()%>
								, <i>FlightDate:</i>
								<%=r.getFdate()%>
								, <i>Route:</i>
								<%=r.getRoute()%>
								,<i>Reviewed On:</i>
								<%=d.toLocaleString()%>
							</footer>
						</blockquote>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<%
				}
					}
			%>
		
	</section>
</div>
<%
	}
%>
<jsp:include page="footer.jsp"></jsp:include>