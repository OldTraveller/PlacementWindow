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
                        <span style="color: #003366;">List Of Public Keys of Participants ...</span>
                    </strong></h1>
                    <h3 class="subtitle"> <span style="color: #003366;">
                    	List of people who can make the contribution as of now. If interested for a key, Contact Us (You know who) 
                    	</span>
                    </h3>
                </div>
            </div>
        </section>
    </section>
    <hr>

    <section class="container w3-animate-zoom" align="center">
  			<h3><strong>LIST OF PEOPLE AND THEIR PUBLIC KEYS<strong></h3>
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
		String sql ="SELECT * FROM USERS";
		System.out.println("QUERY IS : " + sql); 
		resultSet = statement.executeQuery(sql);
		int i = 0; 
		out.println("<hr>");
		System.out.println("SIZE IS : " + resultSet.getFetchSize());
		out.println("<table class='table table-bordered table-hover'>" + 
				"<thead><tr><th style='background-color: #003366; color: white'>NAME</th><th style='color : white; background-color: #003366;'>PUBLIC KEY</th></tr></thead>");
		
		while(resultSet.next()){
				i++; 
				String publicKey = resultSet.getString("PUBLIC_KEY"); 
				String name = resultSet.getString("NAME"); 
				out.println(getDataElement(name, publicKey)); 
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
    <section class="container">
    </section>

    <hr>


<jsp:include page="./partials/footer.jsp" />
