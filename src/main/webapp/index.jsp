<%@ include file = "/partials/header.jsp" %>	
	<!-- WHY US ? -->
	<hr>
		<section class="fp-active" data-block-type="contents">
		  <div class="container">
		  	<section>
		  		<% if (request.getServletContext().getAttribute("VALID") != null) { 
		      		if (request.getServletContext().getAttribute("VALID").equals("NOT_VALID")) {
		      			%>
		      				<div class="alert alert-danger alert-dismissible fade show" role="alert">
							  <strong>Holy !!</strong> You haven't entered a valid combination of public and private keys.
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							</div>
		      			<%
		      		}
		      		request.getServletContext().setAttribute("VALID", null); 
		      	 }
		      	if (request.getServletContext().getAttribute("INSERTED") != null) {
		      		if (request.getServletContext().getAttribute("INSERTED").equals("INSERTED")) {
		      			%>
		      				<div class="alert alert-success alert-dismissible fade show" role="alert">
							  <strong>Nice !!</strong> You will be remembered for your contribution.
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							</div>
		      			<%
		      		} else {
		      			%>
		      			<div class="alert alert-warning alert-dismissible fade show" role="alert">
						  <strong>Hmmm ...</strong> Record didn't insert !! Check from your side. Backend is good.
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						  </button>
						</div>
		      			<%
		      		}
		      		request.getServletContext().setAttribute("INSERTED", null); 
		      	}
		      %>
		  	</section>
		    <div class="row align-items-center">
		      
		      <div class="col-12 col-md-12 col-lg-6 col-xl-5">
		      	
		        <h2 class="text-center bolder w3-animate-bottom">About PlacementWindow ...</h2>
		        <p class="lead mb-5 w3-animate-top">
					Hey Guys, <br> 
					Since the placements are around, I thought of creating this small tool where
					in we can post important stuffs for the placements. <br>
					Sharing of materials and helpful articles etc, will ultimately help each and everyone 
					of us to be aware as to what important our peers might be studying. <br> 
					Ultimately everyone should be benefitted is the Motto. 
				</p>
		      </div>
		      <div class="col-12 col-md-6 col-sm-12 m-auto">
		        <img alt="We Are All Together !!" class="img-fluid black-border" src="images/MainPageImage.png" >
		      </div>
		    </div>
		  </div>
		</section>
	<hr>
<jsp:include page="./partials/footer.jsp" />
