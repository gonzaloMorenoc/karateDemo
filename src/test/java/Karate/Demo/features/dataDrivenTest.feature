@ignore
Feature: data driven test

	Background:
	* url 'http://dummy.restapiexample.com/'
	
	Scenario Outline: create user details
		Given path 'api/v1/create'
		And request {"name":<name>,"salary":<salary>,"age":<age>}
		When method POST
		Then status 200
		Then print 'response 1 ---> ',response
		#* def result = response.data.id
		* def result = '1'
		
		Given path 'api/v1/employee/' + result
		And method GET
		Then status 200
		Then print 'response 2 ---> ',response
		And match response.data contains {id: '#(result)'}
		
		
		Examples:
		|name|salary|age|
		|test|123|23|
		
		
		