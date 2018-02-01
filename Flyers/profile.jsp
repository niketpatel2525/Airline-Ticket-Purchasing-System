<%@page import="model.Error"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.User"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content next-block">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Your Profile</h3>
			</div>
			<%
				if (session.getAttribute("user") == null) {
					response.sendRedirect("/Flyers/error.jsp?errorcode=" + Error.ILLEGAL_ACCESS);
					return;
				}

				User user = (User) session.getAttribute("user");
			%>
			<div class="box-body">
				<div class="row row-form-info">
					<table align="center">
						<tr>
							<th class="right-text">First Name:</th>
							<td class="left-text"><%=user.getFname()%></td>
						</tr>
						<tr>
							<th class="right-text">Last Name:</th>
							<td class="left-text"><%=user.getLname()%></td>
						</tr>
						<tr>
							<th class="right-text">User id:</th>
							<td class="left-text"><%=user.getUsername()%></td>
						</tr>
						<tr>
							<th class="right-text">Password:</th>
							<td class="left-text"><%=user.getPassword()%></td>
						</tr>
						<tr>
							<th class="right-text">Join Date</th>
							<td class="left-text">
								<%
									Date d = new Date(user.getDatecreated());
									out.print(d.toLocaleString());
								%>
							</td>
						</tr>
						<tr>
							<th class="right-text">Street Address</th>
							<td class="left-text"><%=user.getSaddr()%></td>
						</tr>
						<tr>
							<th class="right-text">City</th>
							<td class="left-text"><%=user.getCity()%></td>
						</tr>
						<tr>
							<th class="right-text">State</th>
							<td class="left-text"><%=user.getState()%></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>