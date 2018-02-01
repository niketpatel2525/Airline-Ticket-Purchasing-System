<%@page import="model.Error"%>
<%@page import="model.*"%>
<jsp:include page="header.jsp"></jsp:include>
<%
	int resultcode = 0;
	if (request.getParameter("errorcode") != null) {
		resultcode = Integer.parseInt(request.getParameter("errorcode"));
	}
%>
<div class="content-wrapper no-margin">
	<section class="content">
		<div class="error-page">
			<h2 class="headline text-yellow"><%=resultcode%></h2>
			<div class="error-content">
				<h3>
					<i class="fa fa-warning text-yellow"></i> Oops!
					<%=Error.getErrorCode(resultcode)%>
				</h3>
				<p>
					We will try to resolve the issue. Meanwhile, you may
					<a href="/Flyers/home.jsp">return to dashboard</a>
				</p>
			</div>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>