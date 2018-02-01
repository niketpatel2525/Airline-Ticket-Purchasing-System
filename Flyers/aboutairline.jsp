<jsp:include page="header.jsp"></jsp:include>

<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">About Your Airline</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=aboutairline" method="post">
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Airline Name</label>
								<input type="text" name="airlinename" class="form-control" id="exampleInputEmail1" placeholder="Name of Your Airline">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputPassword1">Image</label>
								<input type="file" name="image" class="form-control" id="exampleInputPassword1" placeholder="First Class Fare">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="exampleInputEmail1">Description</label>
								<textarea name="description" class="textarea" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Submit" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>