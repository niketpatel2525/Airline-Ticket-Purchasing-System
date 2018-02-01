<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.DailySale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="pojo.Sales"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Sales Data</h3>
			</div>
			<div class="box-body">
			<form action="/Flyers/DownloadSalesPDF" method="post">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Airline</th>
							<th>Flight #</th>
							<th>Flight</th>
							<th>Ticket Sold</th>
							<th>Revenue</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (request.getAttribute("salesdata") != null) {
								LinkedList<Sales> sales = (LinkedList<Sales>) request.getAttribute("salesdata");
								DecimalFormat df = new DecimalFormat(".##");
								for (Sales s : sales) {
						%>
						<tr>
							<td><%=s.getAirlinename()%></td>
							<td><%=s.getFlightid()%></td>
							<td><%=s.getFlight()%></td>
							<td><%=s.getTicketsold()%></td>
							<td><%=df.format(s.getRevenue())%></td>
						</tr>
						
						<%
							}
							}
						%>
						<tr>
							<td>
							<input type="submit" value="Download Total Sales Report" class="btn btn-primary">
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<hr>
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<b>
							<center>Sales By Route</center>
						</b>
						<div id='barchart_div' style='border: 1px solid #CCC'></div>
					</div>
				</div>
			</div>
			<hr>
			<div class="box-header with-border">
				<center>
					<h3 class="box-title">Daily Sales Data</h3>
				</center>
			</div>
			<div class="box-body">
			<form action="/Flyers/DownloadDailySalesPDF" method="post">
				<table id="example2" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Date</th>
							<th>Ticket Sold</th>
							<th>Total Sale</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (request.getAttribute("dailysale") != null) {
								LinkedList<DailySale> sales = (LinkedList<DailySale>) request.getAttribute("dailysale");
								DecimalFormat df = new DecimalFormat(".##");
								for (DailySale s : sales) {
									Date d = new Date(s.getDate());
									DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						%>
						<tr>
							<td><%=sdf.format(d)%></td>
							<td><%=s.getTotaltickets()%></td>
							<td>
								$<%=s.getTotalsale()%></td>
						</tr>
						
						<%
							}
							}
						%>
						<tr>
							<td>
							<input type="submit" value="Download Daily Sales Report" class="btn btn-primary">
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable({

		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example2').DataTable({

		});
	});
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="scripts/sales.js"></script>