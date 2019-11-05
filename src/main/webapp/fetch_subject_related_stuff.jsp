<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.net.URISyntaxException"%>

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
		String sql ="SELECT * FROM IMPORTANT_TOPICS WHERE SUBJECT_ID = " + id + ";";
		System.out.println("QUERY IS : " + sql); 
		resultSet = statement.executeQuery(sql);
		int i = 0; 
		out.println("<hr>");
		out.println("<div id='accordion'");
		System.out.println("SIZE IS : " + resultSet.getFetchSize());
		while(resultSet.next()){
				i++;
				String postId = resultSet.getString("POST_ID");
				String topicName = resultSet.getString("TOPIC_NAME"); 
				String topicDescription = resultSet.getString("TOPIC_DESCRIPTION");
				String link = resultSet.getString("LINK"); 
				int subjectId = resultSet.getInt("SUBJECT_ID");
				
				out.println("<div class='card'>");
						out.println("<div class='card-header'>");
								out.println("<a style='color: black;' class='collapsed card-link' data-toggle='collapse' href='#collapse" + i + "'><strong style='color: black;'> TOPIC NAME : </strong></span><span style='color: #OD3D56'>" + topicName + "</span>");
				        out.println("</a>");
				        		out.println("</div>");
				        				out.println("<div id='collapse" + i + "' class='collapse' data-parent='accordion'>");
				        						out.println("<div class='card-body' style='color: black;'>" + topicDescription);
				        
				        out.println("</div>");
				        		out.println("<h6 style='color: black'>POST_ID : <span style='color: green'>" + postId + "</span></h6>"); 
						        out.println("<a href='"+ link +"' target='_blank'>" + link);
						        out.println("<script src='" + link + "'></script>");
						        out.println("</a>");
				        out.println("</div>");
		}
		out.println("</div>");
		if (i == 0) {
			out.println("<h3 align='center' style='color: red;'><strong>NO POSTS PRESENT !!</strong></h3>");
		}
	connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>