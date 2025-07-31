package Karate.Demo.features;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class WriteData {
    
    private static final String DEFAULT_FILENAME = "output.txt";
    private static final String DEFAULT_ENCODING = "UTF-8";
    
    public static boolean writeData(String content) {
        return writeData(content, DEFAULT_FILENAME);
    }
    
    public static boolean writeData(String content, String filename) {
        try {
            Path filePath = Paths.get(filename);
            Files.write(filePath, content.getBytes(DEFAULT_ENCODING), 
                       StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
            return true;
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
            return false;
        }
    }
    
    public static boolean appendData(String content, String filename) {
        try {
            Path filePath = Paths.get(filename);
            Files.write(filePath, content.getBytes(DEFAULT_ENCODING), 
                       StandardOpenOption.CREATE, StandardOpenOption.APPEND);
            return true;
        } catch (IOException e) {
            System.err.println("Error appending to file: " + e.getMessage());
            return false;
        }
    }
}