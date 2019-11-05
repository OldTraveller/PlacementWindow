<%@ include file = "/partials/header.jsp" %>	
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
        <hr>
    <section class="container totn-border w3-animate-right">
        <section class="hero is-black">

            <div class="hero-body" >
                <div class="container" align="center">
                    <h1 ><strong>
                        <span style="color: #003366;">Add a USER to USER_DETAILS table</span>
                    </strong></h1>
                </div>
            </div>
        </section>
    </section>
    <hr>
    <section class="container w3-animate-zoom" align="center">
	  		<section class="container" align="center">
	    		<div class="row">
	    			<div class="col-md-3"></div>
	    			<div class="col-md-6">
	    			<form action="AddUser" method="post">
						  <div class="form-group">
						  	<h3>USN OF THE PERSON</h3>
						    <input type="text" class="form-control" name="USN">
						  </div>
						  <div class="form-group">
						  	<h3>NAME OF THE PERSON</h3>
						    <input type="text" class="form-control" name="NAME">
						  </div>
						  <div class="form-group">
						  	<h3>EMAIL OF THE PERSON</h3>
						    <input type="text" class="form-control" name="EMAIL">
						  </div>
						  <button type="submit" class="btn btn-primary">ADD USER</button>
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
