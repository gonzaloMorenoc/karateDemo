Feature: Modern API Testing Patterns

Background:
    * url baseUrl
    * configure headers = commonHeaders

Scenario: Complete CRUD operations
    Given path '/users'
    
    When method GET
    Then status 200
    And match response.data == '#[]'
    And match each response.data contains { id: '#number', email: '#regex .+@.+' }
    
    Given request { "name": "John", "job": "Developer" }
    When method POST
    Then status 201
    And match response contains { "name": "John", "job": "Developer" }
    * def userId = response.id
    
    Given path '/users', userId
    And request { "name": "John Updated", "job": "Senior Developer" }
    When method PUT
    Then status 200
    And match response.name == 'John Updated'
    
    Given path '/users', userId
    When method DELETE
    Then status 204

Scenario: Error handling and validation
    Given path '/users/invalid'
    When method GET
    Then status 404
    
    Given path '/users'
    And request { "invalid": "data" }
    When method POST
    Then status 201
    
Scenario: Response time validation
    Given path '/users'
    When method GET
    Then status 200
    And assert responseTime < 3000

Scenario: Schema validation
    Given path '/users/2'
    When method GET
    Then status 200
    And match response ==
    """
    {
        "data": {
            "id": 2,
            "email": "#string",
            "first_name": "#string",
            "last_name": "#string",
            "avatar": "#string"
        },
        "support": {
            "url": "#string",
            "text": "#string"
        }
    }
    """