
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@page import="model.MySqlDataStoreUtilities"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="airlineleftnav.jsp"></jsp:include>
<div class="content-wrapper">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Available Offers</h3>
			</div>
			<%
					
				MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();
				LinkedHashMap<String, ArrayList<Object>> offers;
				offers = msdsu.getOffers();
			%>
			<div class="box-body">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Offer</th>
							<th>Offer Description</th>
							<th>Promo Code</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(Map.Entry<String, ArrayList<Object>> m :offers.entrySet())
							{
								ArrayList<Object> values = m.getValue();
								String offername = (String)values.get(0);
								String description = (String)values.get(1);
								String promo = (String)values.get(2);
						%>
						
						<tr>
							<td><%=offername%></td>
							<td><%=description%></td>
							<td><%=promo%></td>
						</tr>
						<%
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