<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Add Aircraft</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=aircraft" method="post" onsubmit="return validateEmptyFields(this)" id="addUpdateAircraft">
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Aircraft Name</label>
								<input type="text" name="aircraftname" class="form-control" id="exampleInputEmail1" placeholder="Aircraft Name">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Capacity</label>
								<input type="text" name="capacity" class="form-control" id="exampleInputEmail1" placeholder="aircraft capacity">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Add Aircraft" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
