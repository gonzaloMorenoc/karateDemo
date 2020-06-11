Feature: config

Background:
	* def expectedOutput = read('../data/result2.json')

Scenario: request user 2 details

	Given url url
	When method GET
	Then status 200
	Then print response
	#And match response == expectedOutput
	Then print 'url --> ',url