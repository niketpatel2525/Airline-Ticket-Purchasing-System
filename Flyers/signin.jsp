<jsp:include page="header.jsp"></jsp:include>
<div class="content-wrapper no-margin">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Signin</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=signin" method="post" id="signInForm"  onsubmit="return validateEmptyFields(this)">
				<%
					if (request.getAttribute("msg") != null) {
						String msg = (String) request.getAttribute("msg");
				%>
				<center style="color: red"><%=msg%></center>
				<%
					}
				%>
				<div class="row">
					<div class="col-md-offset-4 col-md-4">
						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Email address</label>
										<input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
										<span style="color:red"></span>
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputPassword1">Password</label>
										<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
										<span style="color:red"></span>
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputPassword1">User Type</label>
										<select class="form-control select2" style="width: 100%;" name="utype" id="utype">
											<option selected="selected">Choose User Type</option>
											<option value="0">Customer</option>
											<option value="1">Admin</option>
											<option value="2">Airline</option>
										</select>
										<span style="color:red"></span>
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<input type="submit" value="Sign In" class="btn btn-block btn-primary btn-lg">
									<label>
										Not Registered Yet?
										<a href="/Flyers/registration.jsp">Sign UP</a>
										Here.
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>