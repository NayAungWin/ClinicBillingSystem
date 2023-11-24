package util;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;



public class PasswordEncoder {
    private static PasswordEncoder instance;
    
    private final static int ITERATION_COUNT = 5;

    public PasswordEncoder() {  }

    public static synchronized PasswordEncoder getInstance() {
        if (instance == null) {
            PasswordEncoder returnPasswordEncoder = new PasswordEncoder();
            return returnPasswordEncoder;
        }
        else
            return instance;
    }

    public synchronized String encode(String password, String saltKey)throws NoSuchAlgorithmException, IOException {
        String encodedPassword = null;
        byte[] salt = base64ToByte(saltKey);

        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.reset();
        digest.update(salt);

        byte[] btPass = digest.digest(password.getBytes("UTF-8"));
        for (int i = 0; i < ITERATION_COUNT; i++) {
            digest.reset();
            btPass = digest.digest(btPass);
        }

        encodedPassword = byteToBase64(btPass);
        return encodedPassword;
    }
//    
//    public synchronized String decode(String password, String saltKey)throws NoSuchAlgorithmException, IOException {
//        String decodedPassword = null;
//        byte[] salt = base64ToByte(saltKey);
//
//        MessageDigest digest = MessageDigest.getInstance("SHA-256");
//        digest.reset();
//        digest.update(salt);
//
//        byte[] btPass = digest.digest(password.getBytes("UTF-8"));
//        for (int i = 0; i < ITERATION_COUNT; i++) {
//            digest.reset();
//            btPass = digest.digest(btPass);
//        }
//        decodedPassword = byteToBase64(btPass);
//        return decodedPassword;
//    }
    private byte[] base64ToByte(String str) throws IOException {
        Decoder.BASE64Decoder decoder = new Decoder.BASE64Decoder();
        byte[] returnbyteArray = decoder.decodeBuffer(str);
        return returnbyteArray;
    }
    private String byteToBase64(byte[] bt) {
        Decoder.BASE64Encoder endecoder = new Decoder.BASE64Encoder();
        String returnString = endecoder.encode(bt);
        return returnString;
    }
    
    public static String encodePassword(String password) throws NoSuchAlgorithmException, IOException {
          String saltKey = "PveFT7isDjGYFTaYhc2Fzw==";
          String generatePassword;
          
          PasswordEncoder encoder = PasswordEncoder.getInstance();
          generatePassword = encoder.encode(password, saltKey);
    	return generatePassword;
    }
}
