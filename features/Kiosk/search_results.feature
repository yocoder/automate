Feature: Search Results Feature

  @wip
  Scenario: Flying club miles on search results page
    When I am on search results page
    Then I should see the miles multiplier text
 # And The miles are double to the price

  @wip
  Scenario: Search results page Back to top link test
    Given I am on search results page
    And I scroll down
    When I click on back to top arrow
    Then I should go to the top of the page