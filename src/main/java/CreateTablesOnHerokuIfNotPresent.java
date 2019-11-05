

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateTablesOnHerokuIfNotPresent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateTablesOnHerokuIfNotPresent() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MakeTables.createAllTheTables();
		response.sendRedirect("MainPageView");
	}
}
