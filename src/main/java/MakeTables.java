

import java.sql.Connection;
import java.sql.Statement;

import java.security.MessageDigest;

public class MakeTables {
	public static void createAllTheTables() {
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
		Statement st = null ;
		try {
			st = connection.createStatement() ;
			/* MAKE TABLE FOR MEMBERS OF TOTN */
			st.execute("CREATE TABLE IF NOT EXISTS CONTRIBUTION ("
					+ "PUBLIC_KEY CHARACTER(40) NOT NULL,"
					+ "DESCRIPTION VARCHAR(100) NOT NULL, "
					+ "LINK VARCHAR(200), "
					+ "SUBJECT_ID INT)") ;
			System.out.println("TABLE : CONTRIBUTIONS HAS BEEN MADE !");
			
			/* MAKE TABLE FOR THE LOGIN DETAILS ! */
			st.execute("CREATE TABLE IF NOT EXISTS SUBJECTS ("
					+ " SUBJECT_ID INT NOT NULL,"
					+ " SUBJECT_NAME VARCHAR(45) NOT NULL)");
			st.execute("INSERT INTO SUBJECTS VALUES (1, 'DATA STRUCTURES')");
			st.execute("INSERT INTO SUBJECTS VALUES (2, 'ALGORITHMS')");
			st.execute("INSERT INTO SUBJECTS VALUES (3, 'OPERATING SYSTEMS')");
			st.execute("INSERT INTO SUBJECTS VALUES (4, 'DBMS')");
			st.execute("INSERT INTO SUBJECTS VALUES (5, 'OTHERS')");
			System.out.println("SUBJECTS TABLE CREATED THING CREATED !");
			
			
			/* MAKE TABLE FOR THE LOGIN DETAILS ! */
			st.execute("CREATE TABLE IF NOT EXISTS IMPORTANT_TOPICS ("
					+ " TOPIC_ID CHARACTER(40) NOT NULL,"
					+ " SUBJECT_ID INT NOT NULL,"
					+ " DESCRIPTION INT NOT NULL,"
					+ " IMPORTANCE INT NOT NULL,"
					+ " LINK VARCHAR(200))");
			System.out.println("IMPORTANT_TOPICS TABLE CREATED THING CREATED !");
			
			
			/* TABLE FOR THE QUESTIONS TO BE CREATED !! */ 
			st.execute("CREATE TABLE IF NOT EXISTS QUESTIONS ("
					+ " QUESTION_ID CHARACTER(40) NOT NULL,"
					+ " DESCRIPTION VARCHAR(500) NOT NULL,"
					+ " WHO_ASKED_ID VARCHAR(40) NOT NULL)");
			System.out.println("QUESTIONS TABLE CREATED THING CREATED !");
			
			/* CREATE TABLE FOR THE DIFFERNET USERS */
			st.execute("CREATE TABLE IF NOT EXISTS USERS ("
					+ " PUBLIC_KEY CHARACTER(40) NOT NULL,"
					+ " PRIVATE_KEY CHARACTER(40) NOT NULL,"
					+ " NAME VARCHAR(60) NOT NULL,"
					+ " EMAIL VARCHAR(60) NOT NULL)");
			System.out.println("USERS TABLE CREATED THING CREATED !");
			
			
			st.execute("CREATE TABLE IF NOT EXISTS REPLIES_TO_QUESTIONS ("
					+ " QUESTION_ID CHARACTER(40) NOT NULL,"
					+ " ANSWERER_ID CHARACTER(40) NOT NULL,"
					+ " ANSWER_LINK VARCHAR(200) NOT NULL)");
			System.out.println("REPLIES_TO_QUESTIONS TABLE CREATED THING CREATED !");
			
			/* MAKE TABLE FOR THE TUTORS 
			st.execute("CREATE TABLE IF NOT EXISTS TUTORS ( "
					+ "USN CHARACTER(10) NOT NULL)");
			System.out.println("TABLE : TUTORS HAS BEEN MADE ! ");
			
			 MAKE TABLE FOR THE CONTRIBUTION URL 
			st.execute("CREATE TABLE IF NOT EXISTS CONTRIBUTIONS ( "
					+ "USN CHARACTER(10) NOT NULL,"
					+ "GITHUB_GIST VARCHAR(150) NOT NULL,"
					+ "HEADING VARCHAR(30) NOT NULL,"
					+ "ADDITIONAL VARCHAR(100) NOT NULL)");
			System.out.println("TABLE : CONTRIBUTIONS HAS BEEN MADE ! ");
			
			 MAKE TABLE FOR THE OVERALL CREDITS FOR EVERYONE ! 
			st.execute("CREATE TABLE IF NOT EXISTS CREDITS ( "
					+ "USN CHARACTER(10) NOT NULL,"
					+ "SCORE INTEGER NOT NULL )");
			System.out.println("CREDIT_POINTS HAS BEEN MADE !");
			*/
			
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
	}
	
	public static void main(String[] args) {
		createAllTheTables() ; 
	}
}
