Feature: GET Users Call

  Scenario: Get call with request headers method2
  * print tokenID
  Given header Authorization = 'Bearer'+ tokenID
  When url goRestBaseUrl+'/public/v2/users'
  And method GET
  Then status 200
  * print response