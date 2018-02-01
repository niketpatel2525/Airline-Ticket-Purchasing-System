<jsp:include page="header.jsp"></jsp:include>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
            $(document).on("click", "#btn", function() {
               var name = document.getElementById("name").value;
               var email = document.getElementById("email").value;
               var subject = document.getElementById("subject").value;
               var question =  $('#question').val();

               if(name == "" || email == "" || subject == "" || question == "")
               {
               		alert("Enter All Details !!");
               }
               else
               {
                var params = {
    					name: name,
    					email:email,
    					subject:subject,
    					question:question
    			};
                $.post("Help", $.param(params),function(responseText) {
                    $('#contactusform')[0].reset();
                    $("#replace").text(responseText);

                });
                }
            });
 </script>

<div class="content-wrapper no-margin">
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border" style="align:center">
				<h2 class="box-title">Need Help With Flyers?</h2>
			</div>
			<form id="contactusform">

				<div class="row">
          <center><div class=""  id = "replace" style="color:green"></div></center>
					<div class="col-md-offset-4 col-md-4">
						<div class="container">
						<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputPassword1">Full Name</label>
										<input type="text" id = "name" name="name" class="form-control" id="exampleInputEmail1" placeholder="Enter Full Name">
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">E-mail</label>
										<input type="email" id = "email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Subject</label>
										<input type="text" id = "subject" name="subject" class="form-control" id="exampleInputEmail1" placeholder="Subject">
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputPassword1">Your Question:</label>
										<textarea name="question" id = "question" class="form-control"> </textarea>
									</div>
								</div>
							</div>
							<div class="row tspace">
								<div class="col-md-4">
									<input type="button" id="btn" value="Submit" class="btn btn-primary">
									<br><br>
									<label>
										Contact Us:
									</label>
									<br>
									<label>Address:</label><br>
									<p>8854 La Crosse Ave <br/> Skokie, IL, 60077 <br/> USA</p>
									<label>Call Us:</label><br>
									<p>+1 909-421-6379</p>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
