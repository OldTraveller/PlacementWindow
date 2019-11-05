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
                        <span style="color: #003366;">TYPE THE SQL Query below</span>
                    </strong></h1>
                </div>
            </div>
        </section>
    </section>
    <hr>
    <section class="container w3-animate-zoom" align="center">
	  		<section class="container" align="center">
	    		<div class="row">
	    			<div class="col-md-2"></div>
	    			<div class="col-md-8">
	    			<form action="ExecuteQuery" method="POST">
						  <div class="form-group">
						  	<h3>SQL QUERY</h3>
						    <input type="text" class="form-control" placeholder="SQL Query here ...">
						  </div>
						  <button type="submit" class="btn btn-primary">EXECUTE</button>
						</form>
	    			</div>
	    			<div class="col-md-2"></div>
	    		</div>
	    	</section>
    </section>
    
    <section class="container">
    	<div id="whatType" align="center"></div>
    	<div class="row">
    	<div class="col-md-3 col-sm-12"></div>
    	<div class="col-md-6 col-sm-12"><div id="populateHere" align="center" style="word-wrap:break-word"></div></div>
    	<div class="col-md-3 col-sm-12"></div>
    	
    	</div>
    </section>
    
    <hr>
    <section class="container">
    </section>
	
         <section class="container totn-border w3-animate-left">
        <article class="message is-dark">
            <div class="message-body"><strong>
            	<span style="color : red;">This facility is only in case when you forget your secret SHA Hash Value or haven't stored it on PC.<br></span>
            	<span style="color : green;">Make sure that you don't have to visit this again and again<br></span>
            	</strong>
            </div>
        </article>
    </section>
    <hr>

<jsp:include page="./partials/footer.jsp" />
