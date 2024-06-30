Feature: GET call with request headers

  Scenario: Get call with request headers method1
  Given header Content-Type = 'text/xml;charset=ISO-8859-1'
  And header Accept-Encoding = 'gzip,deflate'
  And header Connection = 'Keep-Alive'
  
  When url goRestBaseUrl+'/public/v2/users'
  And method GET
  Then status 200
  * print response
  
  Scenario: Get call with request headers method2
  * def request_headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Accept-Encoding: 'gzip,deflate', Connection: 'Keep-Alive'}
  Given headers request_headers
  When url goRestBaseUrl+'/public/v2/users'
  And method GET
  Then status 200
  * print response
  
  Scenario: Get call with request headers method3
  * configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Accept-Encoding: 'gzip,deflate', Connection: 'Keep-Alive'}
  Given url goRestBaseUrl+'/public/v2/users'
  And method GET
  Then status 200
  * print response
