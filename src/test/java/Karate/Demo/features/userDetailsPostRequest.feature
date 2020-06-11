@ignore
Feature: post call test

	Background:
	* def jsonPayload = read('../data/request1.json')
	* url 'https://reqres.in/api/users'
	* header Content-Type = 'application/json'
	
	Scenario: create user details
		And request jsonPayload
		And param delay = 3
		When method POST
		Then status 201
		Then print 'response ---> ',response