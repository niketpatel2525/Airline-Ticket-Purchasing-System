<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">About Your Airline</h3>
			</div>
			<%
				LinkedList<String> airlines = null;
				if (request.getAttribute("airline") != null) {
					airlines = (LinkedList<String>) request.getAttribute("airline");
			%>
			<div class="box-body">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Airline</th>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<%
							for (String s : airlines) {
						%><tr>
							<td><%=s%></td>
							<td>
								<a href="/Flyers/FlightServlet?code=airlinedetail&airline=<%=s%>" class="btn btn-success ">View Airline Page</a>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<%
			}
		%>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable({
			"ordering" : false
		});
	});
</script>