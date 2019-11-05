<jsp:include page="./partials/header.jsp"/>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>

<section class="fdb-block fp-active" data-block-type="pricings" data-id="1" draggable="true">
  <div class="container">
    <div class="row text-center w3-animate-top" style="background-color: #383838 ; border: 4px solid black ; color:white">
      <div class="col bg-black">
        <h1>WELCOME, TheOldTraveller</h1>
      </div>
    </div>
	<%
		String huaStatus = (String)request.getServletContext().getAttribute("HUA"); 
		if (huaStatus != null) { 
			if (huaStatus.equals("HAAN")) { %>
				<div class="alert alert-success" role="alert">
				  HUA EXECUTE !! 
				</div>
			<% } else { %>
				<div class="alert alert-danger" role="alert">
				  NAHI HUA EXECUTE !! 
				</div>
			<% } 
			request.getServletContext().setAttribute("HUA", null); 
			%>
		<% } 
	%>
    <div class="row mt-5 align-items-top">
      <div class="col-12 col-sm-10 col-md-8 m-auto col-lg-4 text-left w3-animate-zoom">
        <div class="br">
          <div class="bg-black p-3 text-center">
            <h2 class="font-weight-light">ADD PERSON</h2>
            <p class="text-center pt-5"><a href="AddPerson" class="btn btn-round ">CLICK HERE</a></p>
          </div>
        </div>
      </div>

      <div class="col-12 col-sm-10 col-md-8 m-auto col-lg-4 text-left pt-4 pt-lg-0 w3-animate-zoom">
        <div class="">
          <div class="totn-border  p-3 text-center">
            <h2 class="font-weight-light ">MODIFY CONTRIBUTIONS</h2>
            <p class="text-center pt-5"><a href="ViewDoctorsView" class="btn btn-round">CLICK HERE</a></p>
          </div>
        </div>
      </div>

      <div class="col-12 col-sm-10 col-md-8 m-auto col-lg-4 text-left pt-4 pt-lg-0 w3-animate-zoom">
        <div class="br">
          <div class="bg-black p-3 text-center">
            <h2 class="font-weight-light">EDIT DETAILS</h2>
            <p class="text-center pt-5"><a href="ViewAdminChoice" class="btn btn-round">CLICK HERE</a></p>
          </div>
        </div>
      </div>
      
      <div class="col-12 col-sm-10 col-md-8 m-auto col-lg-4 text-left pt-4 pt-lg-0 w3-animate-zoom">
        <div class="br">
          <div class="bg-black p-3 text-center">
            <h2 class="font-weight-light">EXECUTE THE FUCKING INSTRUCTIONS</h2>
            <p class="text-center pt-5"><a href="ExecuteSQL" class="btn btn-round">CLICK HERE</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
	.totn-border {
		border: 2px solid black;
	}
</style>
<jsp:include page="./partials/footer.jsp"/>

