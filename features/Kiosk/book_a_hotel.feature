@jira-web-1111 @sprint45 @book-a-hotel
Feature: Book a Hotel
  In order to have a cofirmed hotel booking
  As a guest
  I want to make a booking

Scenario: Book a hotel (end to end)
    Given I am on "book a hotel" home page
    When I book a hotel
    Then I should see the hotel confirmation for the guests

  @wip @regression
  Scenario:Pods on Guest details Page
    Given I am on guest details page

  @wip
  Scenario:Pods on search details Page
    Given I am on search details page
    When I search for "orlando"
@wip
  Scenario: Book a hotel  for 7 nights from  a date
    Given I am on "book a hotel" home page
    When I book a hotel on "20th" of "June 2015"
    Then I should see the hotel confirmation for 7 nights

