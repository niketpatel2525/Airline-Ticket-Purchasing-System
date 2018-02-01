
<%
	if (request.getAttribute("LEFTNAVFOOTER") != null) {
		boolean leftNav = (Boolean) request.getAttribute("LEFTNAVFOOTER");
		if (leftNav) {
%>
<footer class="main-footer">
	<%
		} else {
	%>
	<footer class="main-footer full-width">
		<%
			}
				request.setAttribute("LEFTNAVFOOTER", false);
			} else {
		%>
		<footer class="main-footer full-width">
			<%
				}
			%>
			<div class="pull-right hidden-xs">
				<b>CSP584</b>
				Team#1
			</div>
			<strong>Copyright &copy; 2017-2018 <a href="/Flyers">Team#1</a>.
			</strong> All rights reserved.
		</footer>
		<!-- jQuery 3 -->
		<script src="scripts/jquery.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script src="scripts/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<!-- Bootstrap 3.3.7 -->
		<script src="scripts/bootstrap.min.js"></script>
		<!-- Morris.js charts -->
		<script src="scripts/raphael.min.js"></script>
		<!-- <script src="scripts/morris.min.js"></script> -->
		<!-- Sparkline -->
		<script src="scripts/jquery.sparkline.min.js"></script>
		<!-- jvectormap -->
		<script src="scripts/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="scripts/jquery-jvectormap-world-mill-en.js"></script>
		<!-- jQuery Knob Chart -->
		<script src="scripts/jquery.knob.min.js"></script>
		<!-- daterangepicker -->
		<script src="scripts/moment.min.js"></script>
		<script src="scripts/daterangepicker.js"></script>
		<!-- datepicker -->
		<script src="scripts/bootstrap-datepicker.min.js"></script>
		<!-- Bootstrap WYSIHTML5 -->
		<script src="scripts/bootstrap3-wysihtml5.all.min.js"></script>
		<!-- Slimscroll -->
		<script src="scripts/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="scripts/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="scripts/adminlte.min.js"></script>
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<!-- <script src="scripts/dashboard.js"></script> -->
		<!-- AdminLTE for demo purposes -->
		<script src="scripts/demo.js"></script>
		<script src="scripts/jquery.localScroll.min.js"></script>
		<script src="scripts/jquery.scrollTo.min.js"></script>
		<script src="scripts/jquery.dataTables.min.js"></script>
		<script src="scripts/formValidator.js"></script>
		<script type="text/javascript">
			$('.carousel').carousel()
		</script>
		</body>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#noll').localScroll({
					duration : 800
				});
			});
		</script>
		</html>