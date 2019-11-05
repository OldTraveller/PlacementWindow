

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/* 
 * 	USE POSTGRE OR MySQL - THE BASIC QUERIES ARE ALL SAME IN BOTH !!
 *  HOWEVER, SOME MIGHT BE DIFFERENT !! 
 */

public class PostgresConnection {
	private static final String URL = "jdbc:postgresql://localhost:5432/TheOldTravellerNetwork" ;
	private static final String USERNAME =  "postgres";
	private static final String PASSWORD = "root";
	/* 
	 * For Heroku Dev Environment we have the function to get Connection to the Heroku 
	 * PostGres Database !
	 */
	public static Connection getLocalConnection() throws URISyntaxException, SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");	
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
	
	/*
	 * For testing in the local machine we are using MySQL Database
	 * Schema : TheOldTravellerNetwork
	 */
	public static Connection getHerokuConnection() throws URISyntaxException, SQLException, ClassNotFoundException {
		 String dbUrl = System.getenv("JDBC_DATABASE_URL");
		 return DriverManager.getConnection(dbUrl);
	}
}
