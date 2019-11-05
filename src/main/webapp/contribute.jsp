<%@ include file = "/partials/header.jsp" %>	
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URISyntaxException" %>
<%@page import="java.sql.SQLException"%>

    <section class="container totn-border w3-animate-right">
        <section class="hero is-black">
            <div class="hero-body" >
                <div class="container" align="center">
                    <h1 ><strong>
                        <span style="color: #003366;">Contribute if you have keys !!!</span>
                    </strong></h1>
                    <h3 class="subtitle"> <span style="color: #003366;">
                    	Just enter the details along with your keys, and see your post appearing in 
                    	the topics page
                    	</span>
                    </h3>
                </div>
            </div>
        </section>
    </section>
    <hr>
    <section class="container w3-animate-zoom" align="center">
  			<h2><strong>Information Here</strong></h2>
  			<hr>
	  		<section class="container" align="center">
	    		<div class="row">
	    			<div class="col-md-3"></div>
	    			<div class="col-md-6">
	    			<form action="AddTopic" method="POST">
						  <div class="form-group">
						  	<h3>YOUR PUBLIC KEY</h3>
						    <input type="text" class="form-control" name="PUBLIC_KEY" placeholder="PUBLIC KEY" required>
						  </div>
						  <div class="form-group">
						  	<h3>YOUR PRIVATE KEY</h3>
						    <input type="text" class="form-control" name = "PRIVATE_KEY" placeholder="PRIVATE KEY" required>
						  </div>
						  <div class="form-group">
						  	<h3>TOPIC NAME</h3>
						    <input type="text" class="form-control" name="TOPIC_NAME" placeholder="TOPIC NAME" required> 
						  </div>
						  <div class="form-group">
						  	<h3>LINK</h3>
						    <input type="text" class="form-control" name="LINK" placeholder="LINK IF ANY ..." required>
						  </div>
						  <div class="form-group">
						  	<h3>SUBJECT</h3>
						    <p class="control">
							    <span class="select" >
							      <select name="SUBJECT_ID" required>
							        <option value="1">DATA STRUCTURES</option>
							        <option value="2">ALGORITHMS</option>
							        <option value="3">OPERATING SYSTEMS</option>
							        <option value="4">DATABASE MANAGEMENT SYSTEMS</option>
							        <option value="5">OTHERS</option>
							      </select>
							    </span>
							  </p>
						  </div>
						  <div class="form-group">
						  	<h3>DESCRIPTION</h3>
    						<textarea class="form-control" rows="8" name="DESCRIPTION" required></textarea>
						  </div>
						  <button type="submit" class="btn btn-primary">Submit</button>
						</form>
	    			</div>
	    			<div class="col-md-3"></div>
	    		</div>
	    	</section>
    </section>

    <hr>
<section class="container w3-animate-zoom" align="center">
  			<h3><strong>CONTRIBUTION MADE TILL DATE<strong></h3>
  			<hr>
<%!
	public static String getDataElement(String key, String value) {
		return "<tr><td class='is-half'><strong>" + key + "</strong></td><td class='is-half'>" + value + "</td></tr>";
	}

	public static Connection getHerokuConnection() throws URISyntaxException, SQLException, ClassNotFoundException {
		 String dbUrl = System.getenv("JDBC_DATABASE_URL");
		 return DriverManager.getConnection(dbUrl);
	}
%>
<%
    String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "universal_copy";
	String userid = "root";
	String password = "root";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try{
		String id = request.getParameter("id");
		connection = getHerokuConnection();
		statement=connection.createStatement();
		String sql ="SELECT * FROM LINKING_TABLE";
		System.out.println("QUERY IS : " + sql); 
		resultSet = statement.executeQuery(sql);
		int i = 0; 
		out.println("<hr>");
		System.out.println("SIZE IS : " + resultSet.getFetchSize());
		out.println("<table class='table table-bordered table-hover'>" + 
				"<thead><tr><th style='background-color: #003366; color: white'>POST_ID</th><th style='color : white; background-color: #003366;'>PUBLIC_KEY_CONTRIBUTOR</th></tr></thead>");
		
		while(resultSet.next()){
				i++; 
				String postId = resultSet.getString("POST_ID"); 
				String publicKey = resultSet.getString("PUBLIC_KEY"); 
				out.println(getDataElement(postId, publicKey)); 
		}
		out.println("</table>");
		if (i == 0) {
			out.println("<h3 align='center' style='color: red;'><strong>SORRY BUT NO RECORD WAS FOUND WITH THIS DATA !!</strong></h3>");
		}
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>  			
    </section>
    <hr>

<jsp:include page="./partials/footer.jsp" />
