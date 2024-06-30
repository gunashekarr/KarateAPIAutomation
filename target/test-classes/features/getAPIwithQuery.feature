Feature: GET Call

  Scenario: Get all the active users and assert the number of count
    * def query = {status:'active'}
    Given url goRestBaseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response
    * def userCount = response.length
    * print userCount
    * match userCount == 10
    
  Scenario: Get all the female users
    * def query = {gender:'female'}
    Given url goRestBaseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response 
    
  Scenario: Get all the Active female users
    * def query = {status:'active', gender:'female'}
    Given url goRestBaseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response  