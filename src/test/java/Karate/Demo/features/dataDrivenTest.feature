Feature: Data Driven Tests

Background:
	* url 'https://reqres.in/api/users'

Scenario Outline: Create and validate user
	Given request { "name": "<n>", "job": "<job>" }
	When method POST
	Then status 201
	And match response.name == '<n>'
	And match response.job == '<job>'
	And match response.id == '#string'
	And match response.createdAt == '#string'
	
	Examples:
		| name     | job        |
		| John     | Developer  |
		| Jane     | Tester     |
		| Bob      | Manager    |

Scenario Outline: Create user with CSV data
	Given request { "name": "<n>", "salary": "<salary>", "age": "<age>" }
	When method POST
	Then status 201
	And match response.name == '<n>'
	
	Examples:
		| read('../data/inputData.csv') |