package Karate.Demo.features;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class WriteData {
	public static void writeData(String arg) throws FileNotFoundException, UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("data.txt", "UTF-8");
		writer.println(arg);
		writer.close();
	}
}
