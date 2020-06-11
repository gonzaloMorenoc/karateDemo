@ignore
Feature: user Details

Background:
	* def expectedOutput = read('../data/result2.json')
	* def feature = read('userDetails.feature')
	* def result = call feature


Scenario: request user 3 details
	Given url 'https://reqres.in/api/users/3'
	When method GET
	Then status 200
	#Then print response
	And match response == expectedOutput
	Then print 'result -----> ',result
	* def first_name = result.response.data.first_name
	Then print 'fist_name_value ---> ',first_name
	
	Scenario: request user 4 details
	Given url 'https://reqres.in/api/users/4'
	When method GET
	Then status 200
