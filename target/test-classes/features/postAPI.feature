Feature: Post API Call

Background:
 * url 'https://gorest.co.in'
 #* def Header Authorization = 'Bearer ' + tokenID
 * def requestBody =
 """
   {
        "name": "Testing011",
        "email": "testing001@test.com.in",
        "gender": "female",
        "status": "active"
    }
 """

Scenario: Create a new user
Given path '/public/v2/users'
And header Authorization = 'Bearer ' + tokenID
And request requestBody
When method post
Then status 201