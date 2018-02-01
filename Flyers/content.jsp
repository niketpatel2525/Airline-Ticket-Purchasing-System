<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="styles/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="styles/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="styles/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="styles/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="styles/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet" href="styles/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="styles/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet" href="styles/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="styles/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="styles/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" href="styles/mystyle.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header"> <!-- Logo --> <a href="home.jsp"
			class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
			class="logo-mini"></span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><i class="fa fa-plane rspace"
				aria-hidden="true"></i><b>Flypers</b></span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top">

		<div class="navbar-custom-menu full-width">
			<ul class="nav navbar-nav full-width">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 4 messages</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li>
									<!-- start message --> <a href="#">
										<div class="pull-left">
											<img src="images/user_m.png" class="img-circle"
												alt="User Image">
										</div>
										<h4>
											Support Team <small><i class="fa fa-clock-o"></i> 5
												mins</small>
										</h4>
										<p>Why not buy a new awesome theme?</p>
								</a>
								</li>
								<!-- end message -->
								<li><a href="#">
										<div class="pull-left">
											<img src="images/user_m.png" class="img-circle"
												alt="User Image">
										</div>
										<h4>
											AdminLTE Design Team <small><i class="fa fa-clock-o"></i>
												2 hours</small>
										</h4>
										<p>Why not buy a new awesome theme?</p>
								</a></li>
								<li><a href="#">
										<div class="pull-left">
											<img src="images/user_m.png" class="img-circle"
												alt="User Image">
										</div>
										<h4>
											Developers <small><i class="fa fa-clock-o"></i> Today</small>
										</h4>
										<p>Why not buy a new awesome theme?</p>
								</a></li>
								<li><a href="#">
										<div class="pull-left">
											<img src="images/user_m.png" class="img-circle"
												alt="User Image">
										</div>
										<h4>
											Sales Department <small><i class="fa fa-clock-o"></i>
												Yesterday</small>
										</h4>
										<p>Why not buy a new awesome theme?</p>
								</a></li>
								<li><a href="#">
										<div class="pull-left">
											<img src="images/user_m.png" class="img-circle"
												alt="User Image">
										</div>
										<h4>
											Reviewers <small><i class="fa fa-clock-o"></i> 2 days</small>
										</h4>
										<p>Why not buy a new awesome theme?</p>
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">See All Messages</a></li>
					</ul></li>
				<!-- Notifications: style can be found in dropdown.less -->
				<li class="dropdown notifications-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-bell-o"></i> <span class="label label-warning">10</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 10 notifications</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li><a href="#"> <i class="fa fa-users text-aqua"></i>
										5 new members joined today
								</a></li>
								<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
										Very long description here that may not fit into the page and
										may cause design problems
								</a></li>
								<li><a href="#"> <i class="fa fa-users text-red"></i> 5
										new members joined
								</a></li>
								<li><a href="#"> <i
										class="fa fa-shopping-cart text-green"></i> 25 sales made
								</a></li>
								<li><a href="#"> <i class="fa fa-user text-red"></i>
										You changed your username
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">View all</a></li>
					</ul></li>
				<!-- Tasks: style can be found in dropdown.less -->
				<li class="dropdown tasks-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-flag-o"></i> <span class="label label-danger">9</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 9 tasks</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Design some buttons <small class="pull-right">20%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-aqua"
												style="width: 20%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">20% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Create a nice theme <small class="pull-right">40%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-green"
												style="width: 40%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">40% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Some task I need to do <small class="pull-right">60%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-red" style="width: 60%"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Make beautiful transitions <small class="pull-right">80%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-yellow"
												style="width: 80%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">80% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
							</ul>
						</li>
						<li class="footer"><a href="#">View all tasks</a></li>
					</ul></li>
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu pull-right"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="images/user_m.png" class="user-image" alt="User Image">
						<span class="hidden-xs">My Account</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="images/user_m.png"
							class="img-circle" alt="User Image">

							<p>
								Alexander Pierce - Web Developer <small>Member since
									Nov. 2012</small>
							</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</div> <!-- /.row -->
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="#" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
		</nav> </header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper no-margin cover">
			<!-- Main content -->
			 <section class="content welcome-message">
			 <center class="welcome-label">
			 	<h3>Play Your Trip With US.</h3>
			 </center>
			  
			 </section> 
			<section class="content booking">
			<div class="booking-block">
			
			<div class="row">
				<div class="col-md-6">
					<div class="box-body">
						<div class="form-group">
							<div class="radio">
								<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="checked">
								<label>	Round-Trip </label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box-body">
						<div class="form-group">
							<div class="radio">
								<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" >
								<label>	One-Way </label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="box-body">
						<div class="form-group">
							<label>Departure</label>
							<div class="input-group source">
								<div class="input-group-addon">
                    				<i class="fa fa-plane"></i>
                  				</div>
                  				<input class="form-control input-lg" type="text" placeholder="Departure">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box-body">
						<div class="form-group">
							<label>Arrival</label>
							<div class="input-group source">
								<div class="input-group-addon">
                    				<i class="fa fa-plane"></i>
                  				</div>
                  				<input class="form-control input-lg" type="text" placeholder="Arrival">
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-6">
					<div class="box-body">
						<div class="form-group">
							<label>Departure Date</label>
							<div class="input-group source">
								<div class="input-group-addon">
                    				<i class="fa fa-plane"></i>
                  				</div>
                  				<input class="form-control input-lg" type="date" placeholder="Arrival">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box-body">
						<div class="form-group">
							<label>Return Date</label>						
							<div class="input-group source">
								<div class="input-group-addon">
                    				<i class="fa fa-plane"></i>
                  				</div>
                  				<input class="form-control input-lg" type="date" placeholder="Arrival">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="box-body">
						<div class="form-group">
							<label>Cabin Class</label>
							<div class="input-group source">
								<div class="input-group-addon">
                    				<i class="fa fa-plane"></i>
                  				</div>
                  				<select class="form-control input-lg">
                   				<option>Economy</option>
                   				<option>Business</option>
                	            <option>Premium Economy</option>
             					<option>First</option>                  
                  				</select>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="box-body">
						<div class="form-group">
							<label>&nbsp</label>						
							
                  			
                  				<button type="submit" class="btn btn-info input-lg go">
                  					<i class="fa fa-arrow-circle-right fa-3x"></i>
                  				</button>
                  			
							
						</div>
					</div>
				</div>
			</div>
			</div>
			
			</section>
			<!-- </section> -->
			
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<div class="content-wrapper full-width">
			<section class="content next-block">
				<h3><center>Popular in Your State</center></h3>
				// carousel feature...
				
				
			</section>
		</div>


		<footer class="main-footer full-width">
		<div class="pull-right hidden-xs">
			<b>CSP584</b> Team#1
		</div>
		<strong>Copyright &copy; 2017-2018 
			<a href="#">Team#1</a>.
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

		<script type="text/javascript">
			$('.carousel').carousel()
		</script></body>
</html>