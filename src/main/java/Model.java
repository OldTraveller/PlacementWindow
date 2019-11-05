import java.net.URISyntaxException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Model {
	static boolean checkValid(String publicKey, String privateKey) throws ClassNotFoundException, URISyntaxException, SQLException {
		boolean isValid = false; 
		Connection connection = PostgresConnection.getHerokuConnection(); 
		String query = "SELECT * FROM USERS WHERE PUBLIC_KEY = '" + publicKey + "' AND PRIVATE_KEY = '" + privateKey + "'"; 
		Statement statement = connection.createStatement(); 
		ResultSet resultset = statement.executeQuery(query);
		if (resultset.next()) isValid = true; 
		statement.close();
		connection.close();
		return isValid; 
	}

	public static boolean insertIntoTopics(ImportantTopics importantTopics, String publicKey) throws SQLException, ClassNotFoundException, URISyntaxException, NoSuchAlgorithmException {
		Connection connection = PostgresConnection.getHerokuConnection(); 
		boolean isInserted = false;
		String query1 = "INSERT INTO IMPORTANT_TOPICS VALUES (?, ?, ?, ?, ?)"; 
		PreparedStatement statement1 = connection.prepareStatement(query1);
		String query2 = "INSERT INTO LINKING_TABLE VALUES (?, ?)"; 
		PreparedStatement statement2 = connection.prepareStatement(query2);
		
		long currentTimeMillis = System.currentTimeMillis();
		statement1.setString(1, SHA1Hash.getSHAString(String.valueOf(currentTimeMillis)));
		statement1.setInt(2, importantTopics.getSubjectId());
		statement1.setString(3, importantTopics.getTopicName());
		statement1.setString(4, importantTopics.getDescription());
		statement1.setString(5, importantTopics.getLink());
		
		statement2.setString(1, SHA1Hash.getSHAString(String.valueOf(currentTimeMillis)));
		statement2.setString(2, publicKey);
		
		int first = statement1.executeUpdate();
		int second = statement2.executeUpdate();
		
		if (first > 0 && second > 0) isInserted = true;
		statement1.close();
		statement2.close();
		connection.close();
		return isInserted;
	}
}
