@ignore
Feature: Java Functions


	Scenario: call java method
		* def javaDemo = Java.type('Karate.Demo.features.JavaFunctions')
		* def result = new javaDemo().nonstaticfunctions("World");
		Then print 'Result --> ',result
		And match result == 'Hello World'
		* def result2 = javaDemo.staticfun("Static")
		And match result2 == 'I am Static'
		* def javaDemo2 = Java.type('Karate.Demo.features.WriteData')
		* def result3 = javaDemo2.writeData("This is third line")
		
	Scenario: call java method 2
		Given url 'https://reqres.in/api/users?page=2'
		When method GET
		Then status 200
		* def data = response.data
		Then print 'data --> ',data
		* def myFun = 
		"""
			function(arg) {
				for(i=0; i<arg.length; i++) {
					if(arg[i].id == 9) {
						return arg[i].email
					}
				}
			}
		"""
		* def result = call myFun data
		* def javaDemo2 = Java.type('Karate.Demo.features.WriteData')
		* def result3 = javaDemo2.writeData(result)