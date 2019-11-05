

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

/**
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usn = request.getParameter("USN"); 
		String name = request.getParameter("NAME"); 
		String email = request.getParameter("EMAIL"); 
		Connection connection = null ; 
		/*
		 * USE :- getLocalConnection - when using on localhost !
		 * 		  getHerokuConnection - when deployed to Heroku !
		 */
		try {
			connection = PostgresConnection.getHerokuConnection();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		PreparedStatement st = null;
		try {
			st = connection.prepareStatement("INSERT INTO USERS VALUES (?, ?, ?, ?)"); 
			String publicKey = SHA1Hash.getSHAString(usn); 
			String privateKey = SHA1Hash.getSHAString(String.valueOf(System.nanoTime())); 
			st.setString(1, publicKey);
			st.setString(2, privateKey);
			st.setString(3, name);
			st.setString(4, email);
			st.execute();  
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			try {
				if ( connection != null ) {
					connection.close();
				}
			} catch (Exception e) {}
			try {
				if ( st != null ) {
					st.close();
				}
			} catch ( Exception e ) {}
			System.out.println("Tables are created !! " );
		}
		request.getRequestDispatcher("b8c184e286490232849c1a01b416914865be7163").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
