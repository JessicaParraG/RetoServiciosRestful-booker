Feature: Update a booking

  Background:
    * url 'https://restful-booker.herokuapp.com/'
    * request {"firstname":"#(firstname)","lastname":"#(lastname)","totalprice":"#(totalprice)","depositpaid":"#(depositpaid)","bookingdates":{"checkin":"#(checkin)","checkout":"#(checkout)"},"additionalneeds":"#(additionalneeds)"}
    * headers {"Content-Type":"application/json", "Accept":"application/json"}

  Scenario Outline: Update a booking
    * def createBooking = call read('classpath:restful/booker/herokuapp/Booking/CreateBooking.feature')
    * def id = createBooking.response.bookingid
    * def path = 'booking'
    Given path path, id
    When method Put
    Then status 403
    * print response

    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds      |
      | Jose      | Gonzalez | 10000      | true        | 2024-01-04 | 2024-01-20 | Brunch and Breakfast |