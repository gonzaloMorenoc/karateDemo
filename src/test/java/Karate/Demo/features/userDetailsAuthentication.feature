Feature: API Authentication

	Background:
		* url 'https://reqres.in/api/register'
	
	Scenario: Authentication test
		Given path 'token'
		And form field grant_type = 'client_credentials'
		And form field client_id = 'test_client'
		And form field client_secret = 'test_secret'
		When method POST
		Then status 200
		
		* def accessToken = response.access_token
		
		Given path 'users'
		And header Authorization = 'Bearer ' + accessToken
		When method GET
		Then status 200