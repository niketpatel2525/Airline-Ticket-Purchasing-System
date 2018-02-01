<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Error"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MongoDBDataStoreUtilities"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<%
	MongoDBDataStoreUtilities mdsu = new MongoDBDataStoreUtilities();
	HashMap<Integer, LinkedHashMap<String, Float>> topAirline = mdsu.findTopAirline();
	HashMap<Integer, LinkedHashMap<String, Float>> lowestAirline = mdsu.findLowestAirline();
	HashMap<Integer, LinkedHashMap<String, Integer>> topCountry = mdsu.findTopCountry();
%>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Review Report</h3>
			</div>
			<%
				for (Map.Entry<Integer, LinkedHashMap<String, Float>> finalresult : topAirline.entrySet()) {
					int code = finalresult.getKey();
					if (code != Error.SUCCESS) {
						response.sendRedirect("/Flyers/error.jsp?errorcode=" + code);
						return;
					}
			%>
			<div class="box-header with-border">
				<center>
					<h3 class="box-title">Top Rated Airline</h3>
				</center>
			</div>
			<div class="box-body">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>#</th>
							<th>Airline</th>
							<th>Rating</th>
						</tr>
					</thead>
					<tbody>
						<%
							int count = 1;

								for (Map.Entry<String, Float> result : finalresult.getValue().entrySet()) {
						%>
						<tr>
							<td>
								<%=count%>
							</td>
							<td><%=result.getKey()%></td>
							<td><%=result.getValue()%></td>
						</tr>
						<%
							count++;
								}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
			<hr>
			<%
				for (Map.Entry<Integer, LinkedHashMap<String, Float>> finalresult : lowestAirline.entrySet()) {
					int code = finalresult.getKey();
					if (code != Error.SUCCESS) {
						response.sendRedirect("/Flyers/error.jsp?errorcode=" + code);
						return;
					}
			%>
			<div class="box-header with-border">
				<center>
					<h3 class="box-title">Lowest Rated Airline</h3>
				</center>
			</div>
			<div class="box-body">
				<table id="example2" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>#</th>
							<th>Airline</th>
							<th>Rating</th>
						</tr>
					</thead>
					<tbody>
						<%
							int count = 1;

								for (Map.Entry<String, Float> result : finalresult.getValue().entrySet()) {
						%>
						<tr>
							<td>
								<%=count%>
							</td>
							<td><%=result.getKey()%></td>
							<td><%=result.getValue()%></td>
						</tr>
						<%
							count++;
								}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
			<hr>
			<%
				for (Map.Entry<Integer, LinkedHashMap<String, Integer>> finalresult : topCountry.entrySet()) {
					int code = finalresult.getKey();
					if (code != Error.SUCCESS) {
						response.sendRedirect("/Flyers/error.jsp?errorcode=" + code);
						return;
					}
			%>
			<div class="box-header with-border">
				<center>
					<h3 class="box-title">Top Reviewing Country</h3>
				</center>
			</div>
			<div class="box-body">
				<table id="example3" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>#</th>
							<th>Country</th>
							<th>Review</th>
						</tr>
					</thead>
					<tbody>
						<%
							int count = 1;

								for (Map.Entry<String, Integer> result : finalresult.getValue().entrySet()) {
						%>
						<tr>
							<td>
								<%=count%>
							</td>
							<td><%=result.getKey()%></td>
							<td><%=result.getValue()%></td>
						</tr>
						<%
							count++;
								}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#example3').DataTable({

		});
	});
</script>