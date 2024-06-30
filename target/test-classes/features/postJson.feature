Feature: Post API Call with request via json file

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
 * def randomString = random_String(10)
 * print randomString

 * def requestBody = read('classpath:src/test/resources/payload/user.json')
 * set requestBody.email = randomString + "@gmail.com"
 * print requestBody

Scenario: Create a new user
Given path '/public/v2/users'
And header Authorization = 'Bearer ' + tokenID
And request requestBody
When method post
Then status 201
And match $.id == '#present'
And match $.name == '#present'
And match $.name == 'QaFactory'
And match $.email == requestBody.email
