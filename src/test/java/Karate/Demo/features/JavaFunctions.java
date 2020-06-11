package Karate.Demo.features;

public class JavaFunctions {
	public String nonstaticfunctions(String arg) {
		System.out.println("This is a non static functions.");
		return "Hello " + arg;
	}
	
	public static String  staticfun(String arg) {
		System.out.println("This is a static functions.");
		return "I am " + arg;
	}
}
