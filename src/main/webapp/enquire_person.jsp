<%@ include file = "/partials/header.jsp" %>	
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

    <section class="container totn-border w3-animate-right">
        <section class="hero is-black">
            <div class="hero-body" >
                <div class="container" align="center">
                    <h1 ><strong>
                        <span style="color: #003366;">Enquire Person About Any Doubt</span>
                    </strong></h1>
                    <h3 class="subtitle"> <span style="color: #003366;">
                    	In case of any doubt regarding any Articles just copy and paste the ARTICLE ID and reply ..
                    	</span>
                    </h3>
                </div>
            </div>
        </section>
    </section>
    <hr>
    <section class="container w3-animate-zoom" align="center">
  			<h2><strong>Enter the Question Id and Your Query</strong></h2>
  			<hr>
	  		<section class="container" align="center">
	    		<div class="row">
	    			<div class="col-md-3"></div>
	    			<div class="col-md-6">
	    			<form action="RaiseDoubt" method="POST">
						  <div class="form-group">
						  	<h3>POST ID</h3>
						    <input type="text" class="form-control" placeholder="POST ID">
						  </div>
						  <div class="form-group">
						  	<h3>Query Description</h3>
    						<textarea class="form-control" rows="8"></textarea>
						  </div>
						  <button type="submit" class="btn btn-primary">Submit</button>
						</form>
	    			</div>
	    			<div class="col-md-3"></div>
	    		</div>
	    	</section>
    </section>

    <hr>
    <section class="container">
    </section>

    <hr>

<jsp:include page="./partials/footer.jsp" />
