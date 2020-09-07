

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/* 
 * THIS IS THE SHA1 HELPER TO GET THE SHA1 STRING FOR THE PASSWORD STORED !! 
 * SO DON'T WORRY FOR SOMEONE SEEING YOUR PASSWORD !! 
 */
public class SHA1Hash {
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
	
	public static void main(String[] args) throws Exception {
		String passwd = "password_here"; 
		System.out.println("THE SHA HASH : " + getSHAString(passwd));
	}
}
