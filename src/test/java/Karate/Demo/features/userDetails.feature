Feature: User Details API Tests

Background:
	* def expectedUser2 = read('../data/result.json')
	* def expectedUser3 = read('../data/result2.json')
	* url 'https://reqres.in/api/users'

Scenario: Get user 2 details
	Given path 2
	When method GET
	Then status 200
	And match response == expectedUser2
	And match response.data.id == 2
	And match response.data.last_name != null
	And match response.data.email == 'janet.weaver@reqres.in'

Scenario: Get user 3 details
	Given path 3
	When method GET
	Then status 200
	And match response == expectedUser3
	And match response.data.id == 3
	And match response.data.email == 'emma.wong@reqres.in'
	
Scenario: Get user not found
	Given path 999
	When method GET
	Then status 404
	And match response == {}

Scenario: Get users list with pagination
	Given path ''
	And param page = 2
	When method GET
	Then status 200
	And match response.page == 2
	And match response.data == '#[6]'
	And match each response.data contains { id: '#number', email: '#string' }