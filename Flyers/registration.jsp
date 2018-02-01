<jsp:include page="header.jsp"></jsp:include>
<div class="content-wrapper no-margin">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Registration</h3>
			</div>
			<div style="color: red" id="validationBox" align="center"></div>
			<form action="/Flyers/Registration" method="post" id="registerForm" onsubmit="return validateEmptyFields(this)">
				<div class="box-body">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label>
								<input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">User Type</label>
								<select class="form-control select2" name="usertype" style="width: 100%;" name="utype" id="utype">
									<option selected="selected">Choose User Type</option>
									<option value="0">Customer</option>
									<option value="1">Admin</option>
									<option value="2">Airline</option>
								</select>
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">First Name</label>
								<input type="text" name="fname" class="form-control" id="exampleInputfname1" placeholder="Enter First Name">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputPassword1">Last Name</label>
								<input type="text" name="lname" class="form-control" id="exampleInputlname1" placeholder="Enter Last Name">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputEmail1">Street Address</label>
								<input type="text" name="saddr" class="form-control" id="exampleInputStreetAdd1" placeholder="Enter Street Address">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">City</label>
								<input type="text" name="city" class="form-control" id="exampleInputCity1" placeholder="Enter City Name">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="exampleInputPassword1">State</label>
								<input type="text" name="state" class="form-control" id="exampleInputState1" placeholder="Enter State Name">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Register" class="btn btn-block btn-primary btn-lg">
							<label>
								Already Registered?
								<a href="/Flyers/signin.jsp">Sign In</a>
								Here.
							</label>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>