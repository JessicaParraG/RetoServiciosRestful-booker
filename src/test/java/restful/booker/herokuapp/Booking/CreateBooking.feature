Feature: Create a booking

  Background:
    * url 'https://restful-booker.herokuapp.com/'
    * request {"firstname":"#(firstname)","lastname":"#(lastname)","totalprice":"#(totalprice)","depositpaid":"#(depositpaid)","bookingdates":{"checkin":"#(checkin)","checkout":"#(checkout)"},"additionalneeds":"#(additionalneeds)"}
    * headers {"Content-Type":"application/json", "Accept":"application/json"}

  Scenario Outline: Create a new booking
    * def path = 'booking'
    Given path path
    When method Post
    Then status 200
    * print response

    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | Jose      | Gonzalez | 10000      | true        | 2024-01-04 | 2024-01-20 | Brunch          |