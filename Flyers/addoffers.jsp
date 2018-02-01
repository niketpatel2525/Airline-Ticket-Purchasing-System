<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Add Offers</h3>
			</div>
			<form action="/Flyers/FlightServlet?code=addoffer" method="post" onsubmit="return validateEmptyFields(this)" id="addUpdateOffer">
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Offer Name</label>
								<input type="text" name="offername" class="form-control" id="exampleInputEmail1" placeholder="Offer Name">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Offer Description</label>
								<input type="text" name="offerdescription" class="form-control" id="exampleInputEmail1" placeholder="Offer Discription">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Discount (in %)</label>
								<input type="text" name="discount" class="form-control" id="exampleInputEmail1" placeholder="Discount" value="0">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputPassword1">Amount (in $$)</label>
								<input type="text" name="amount" class="form-control" id="exampleInputEmail1" placeholder="Amount off" value="0">
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">Promo Code</label>
								<input type="text" name="promocode" class="form-control" id="exampleInputEmail1" placeholder="Promocode">
								<span style="color:red"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputPassword1">Offer Status</label>
								<select class="form-control select2" name="offerstatus" style="width: 100%;" name="utype">
									<option value="1" selected="selected">Active</option>
									<option value="0">Inactive</option>
								</select>
								<span style="color:red"></span>
							</div>
						</div>
					</div>
					<hr>
					<div class="row tspace">
						<div class="col-md-offset-4 col-md-4">
							<input type="submit" value="Add Offer" class="btn btn-block btn-primary btn-lg">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>