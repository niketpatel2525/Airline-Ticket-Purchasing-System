<%@page import="java.text.DecimalFormat"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<%
					int fsid = (Integer) request.getAttribute("ticket");
					double fare = (Double) request.getAttribute("fare");
					String username = (String) request.getAttribute("username");
					DecimalFormat df = new DecimalFormat(".##");
				%>
				<h3 class="box-title">Ticket Booked</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
					<form action="/Flyers/DownloadPDF" method="post">
						<table>
							<tr>
								<td>Your Flight Ticket Booked.</td>
							</tr>
							<tr>
								<td>
									Your Ticket Number is :
									<%=fsid%></td>
							</tr>
							<tr>
								<td>
									Total Cost is:
									<%=df.format(fare)%></td>
							</tr>
							<tr>
								<td>
									<input type="hidden" name="username" value="<%=username%>">
									
									<input type="hidden" name="ticketid" value="<%=fsid%>">
									<input type = "submit" value = "Download Ticket" class="btn btn-block btn-primary btn-lg">
								</td>
							</tr>
							
						</table>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>