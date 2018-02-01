<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper ">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Add Route</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=addroute" method="post">
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Departure Airport</label>
								<input type="text" name="from" class="form-control" id="exampleInputEmail1" placeholder="from">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Arrival Airport</label>
								<input type="text" name="to" class="form-control" id="exampleInputEmail1" placeholder="to">
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Add Route" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>