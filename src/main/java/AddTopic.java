

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddTopic() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String publicKey = request.getParameter("PUBLIC_KEY"); 
		String privateKey = request.getParameter("PRIVATE_KEY"); 
		String topicName = request.getParameter("TOPIC_NAME"); 
		String link = request.getParameter("LINK"); 
		String importance = request.getParameter("IMPORTANCE"); 
		String description = request.getParameter("DESCRIPTION");
		int subjectId = Integer.parseInt(request.getParameter("SUBJECT_ID")); 
		ImportantTopics importantTopics = new ImportantTopics(); 
		importantTopics.setDescription(description);
		importantTopics.setImportance(importance);
		importantTopics.setPrivateKey(privateKey);
		importantTopics.setPublicKey(publicKey);
		importantTopics.setLink(link);
		importantTopics.setTopicName(topicName);
		importantTopics.setSubjectId(subjectId);
		try {
			if (Model.checkValid(publicKey, privateKey)) {
				System.out.println("YES THE USER IS VALID !");
				if (Model.insertIntoTopics(importantTopics, publicKey)) {
					System.out.println("INSERTING HERE!");
					request.getServletContext().setAttribute("INSERTED", "INSERTED");
				} else {
					System.out.println("CANOT BE INSETERD  HERE!");
					request.getServletContext().setAttribute("INSERTED", "NOT_INSERTED"); 
				}
				request.getServletContext().setAttribute("VALID", "VALID");
			} else {
				System.out.println("YES THE USER IS NOT VALID !");
				request.getServletContext().setAttribute("VALID", "NOT_VALID");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("MainPageView").forward(request, response);
	}

}
