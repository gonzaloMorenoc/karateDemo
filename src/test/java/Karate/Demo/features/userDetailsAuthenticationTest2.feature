@ignore
Feature: API Authentication

	Background:
		* url 'https://reqres.in/api/'
	
	Scenario: Authentication test
	* def params = 
	"""
	{
		'email': '#(email)',
		'password': '#(password)'
	}
	"""

		When path 'oauth2/token'
		And form field grant_type = 'client_credentials'
		And form fields params
		When method POST
		Then status 201
		And print 'response --> ',response
		* def accessToken = response.token
		Then print 'accessToken --> ',accessToken
		