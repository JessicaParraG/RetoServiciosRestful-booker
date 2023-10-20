Feature: Create a token

  Background:
    * url 'https://restful-booker.herokuapp.com/'
    * request {"username":"#(username)","password":"#(password)"}
    * header Content-Type = "application/json"

  Scenario Outline: Create an auth token
    * def path = 'auth'
    Given path path
    When method Post
    Then status 200
    * print response

    Examples:
      | username | password    |
      | admin    | password123 |