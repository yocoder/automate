
Given(/^I am on search results page$/) do
  visit BookAHotelPage
  (on BookAHotelPage).search_for_hotel
end
Then(/^I should see the miles multiplier text$/) do
  (on SearchResultsPage).flying_club_miles
end

And(/^I scroll down$/) do
  (on SearchResultsPage).scroll_down

end

When(/^I click on back to top arrow$/) do
  (on SearchResultsPage).click_back_to_top
end
