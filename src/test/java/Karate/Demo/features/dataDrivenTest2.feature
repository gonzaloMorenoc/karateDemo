@ignore
Feature: data driven test 2

	Background:
	* url 'http://dummy.restapiexample.com/'
	
	Scenario Outline: create user details
		Given path 'api/v1/create'
		And request {"name":<name>,"salary":<salary>,"age":<age>}
		When method POST
		Then status 200
		Then print 'response 1 ---> ',response
		* def result = '1'
		
		Given path 'api/v1/employee/' + result
		And method GET
		Then status 200
		Then print 'response 2 ---> ',response
		And match response.data contains {id: '#(result)'}
		
		
		Examples:
			|read('../data/inputData.csv')|
		
		
		