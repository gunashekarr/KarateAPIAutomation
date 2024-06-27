// https://gorest.co.in/
Feature: GET Users Call

  Scenario: Get All the users
    Given url 'https://dummy.restapiexample.com/api/v1/employees'
    When method GET
    Then status 200
    * print response
    * def responseBody = response
    * print responseBody
    * def actualName = responseBody.data[0].employee_name
    * def actualAge = responseBody.data[0].employee_age
    * def actualSalary = responseBody.data[0].employee_salary
    * print actualName + " " + actualAge + " " + actualSalary
    * match actualName == 'Tiger Nixon'
    * match actualAge == 61
    * match actualSalary == 320800
    
    Scenario: Get All the users
    Given url 'https://dummy.restapiexample.com/api/v1/employee/2'
    When method GET
    Then status 200
    * print response
    * def responseBody = response
    * print responseBody
    * def actualName = responseBody[0].data.employee_name
    * def actualAge = responseBody[0].data.employee_age
    * def actualSalary = responseBody[0].data.employee_salary
    * print actualName + " " + actualAge + " " + actualSalary
    * match actualName == 'Garrett Winters'
    * match actualAge == 63
    * match actualSalary == 170750