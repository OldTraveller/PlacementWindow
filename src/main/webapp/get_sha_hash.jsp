<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%!
	public static String getDataElement(String key, String value) {
		return "<tr><td class='is-half'><strong>" + key + "</strong></td><td class='is-half'>" + value + "</td></tr>";
	}

	public static String getSHAString (String password) throws NoSuchAlgorithmException {
		MessageDigest mDigest = MessageDigest.getInstance("SHA1");
	    byte[] result = mDigest.digest(password.getBytes());
	    
	    /* CAN USE STRING BUILDER ALSO */
	    StringBuffer sb = new StringBuffer();
	    for (int i = 0; i < result.length; i++) {
	        sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
	    }
	    sb.setCharAt(21, 'a');
	    return sb.toString();
	}
%>
<%
	try{
		String id = request.getParameter("id");
		String shaHashValue = getSHAString(id); 
		out.println("<hr>");
		out.println("<h4>" + shaHashValue + "</h4>");
		out.println("<hr>");				
	} catch (Exception e) {
		e.printStackTrace();
	}
%>