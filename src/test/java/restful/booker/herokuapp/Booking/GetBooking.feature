Feature: Get a booking

  Background:
    * url 'https://restful-booker.herokuapp.com/'
    * header Accept = "application/json"

  @Get
  Scenario: Get a new booking
    * def createBooking = call read('classpath:restful/booker/herokuapp/Booking/CreateBooking.feature')
    * def id = createBooking.response.bookingid
    * def path = 'booking'
    Given path path, id
    When method Get
    Then status 200
    And match response contains {firstname: 'Jose'}
    And match response.lastname == '#string'
    * print response