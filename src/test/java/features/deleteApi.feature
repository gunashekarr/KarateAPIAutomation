Feature: Delete API Call

Background:
 * url 'https://gorest.co.in'
 * def random_String = 
 """
 function(s){
   var text = ""
   var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
   for(var i=0; i<s; i++)
   text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
   return text;
 }
 """
 * def requestBody =
 """
   {
        "name": "QaFactory",
        "gender": "female",
        "status": "active"
    }
 """
 * def randomString = random_String(10)
 * print randomString
 * set requestBody.email = randomString + "@gmail.com"
 * print requestBody

Scenario: Delete a new user
#1 Create a User using a Post call
Given path '/public/v2/users'
And header Authorization = 'Bearer ' + tokenID
And request requestBody
When method post
Then status 201
And match $.id == '#present'
And match $.name == '#present'
And match $.name == 'QaFactory'
And match $.email == requestBody.email

# Fetch the user id from the response
* def userId = $.id
* print userId

#2 Read the User
Given path '/public/v2/users/' + userId
And header Authorization = 'Bearer ' + tokenID
When method GET
Then status 200
And match $.id == userId
And match $.name == '#present'
And match $.name == 'QaFactory'
And match $.email == requestBody.email

#3 Delete the User
Given path '/public/v2/users/' + userId
And header Authorization = 'Bearer ' + tokenID
When method delete
Then status 204

#4 Verify the User
Given path '/public/v2/users/' + userId
And header Authorization = 'Bearer ' + tokenID
When method GET
Then status 404
And match $.message == 'Resource not found'

