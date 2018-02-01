<%@page import="java.util.Date"%>
<%@page import="pojo.Passanger"%>
<%@page import="model.Error"%>
<%@page import="pojo.Transaction"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<%
	LinkedList<Transaction> fs = null;
	if (request.getAttribute("tlist") != null) {
		fs = (LinkedList<Transaction>) request.getAttribute("tlist");

	} else {
		response.sendRedirect("/Flyers/error.jsp?errorcode=" + Error.NO_DATA);
	}
%>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Flight Details</h3>
			</div>
			<div class="box-body">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Nationality</th>
							<th>PassportNo</th>
							<th>Seat No</th>
							<th>Booking Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (fs != null) {
								for (Transaction t : fs) {
									Passanger p = t.getPassanger();
									Date d = new Date(t.getBookingdate());
						%>
						<tr>
							<td><%=p.getName()%></td>
							<td><%=p.getGender()%></td>
							<td><%=p.getAge()%></td>
							<td><%=p.getNationality()%></td>
							<td><%=p.getPassportno()%></td>
							<td><%=t.getSeatno()%></td>
							<td><%=d.toLocaleString()%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
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