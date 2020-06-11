@ignore
Feature: user Details

Background:
	* def expectedOutput = read('../data/result2.json')

Scenario: request user 2 details
	Given url 'https://reqres.in/api/users?page=2'
	When method GET
	Then status 200
	* def myFun1 = function(){ return 'Hello' }
	* def returnedData1 = call myFun1
	Then print 'returnedData1 --> ',returnedData1
	* def myFun2 = 
	"""
		function() {
			return 'myData'
		}
	"""
	* def returnedData2 = call myFun2
	Then print 'returnedData2 --> ',returnedData2
	
	
	Scenario: request user 3 details
	Given url 'https://reqres.in/api/users?page=2'
	When method GET
	Then status 200
	* def data = response.data
	Then print 'data --> ',data
	* def myFun3 = 
	"""
		function(arg) {
			for(i=0; i<arg.length; i++) {
				if(arg[i].id == 9) {
					return arg[i]
				}
			}
		}
	"""
	* def numberOfUsers = call myFun3 data
	Then print 'numberOfUsers --> ',numberOfUsers