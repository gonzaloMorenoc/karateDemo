@ignore
Feature: user Details

Background:
	* def expectedOutput = read('../data/result.json')
	* def expectedOutput2 = read('../data/result2.json')
	* url 'https://reqres.in/api/users'

Scenario: request user 2 details

	Given path 2
	When method GET
	Then status 200
	Then print response
	And match response == expectedOutput
	And match response.data.id == 2
	And match response.data.last_name != null
	* def job_code = response.data.job_code
	And match job_code == null

@parallel=false
Scenario: request user 3 details
	Given path 3
	When method GET
	Then status 200
	Then print response
	And match response == expectedOutput2