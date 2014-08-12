
Given(/^I am on "([^"]*)" home page$/) do |arg|
visit BookAHotelPage
end

When(/^I book a hotel$/) do
  (on BookAHotelPage).search_for_hotel
  (on SearchResultsPage).select_a_hotel
  (on HotelDetailsPage).click_on_book_now
  @name = (on GuestDetailsPage).fill_guest_details
  (on PaymentPage).submit_card_details
end

Then(/^I should see the hotel confirmation for the guests$/) do
  (on ConfirmationPage).guest_booking_confirmed(@name).should be_true
end


Given(/^I am on guest details page$/) do
  visit BookAHotelPage
  (on BookAHotelPage).search_for_hotel
  (on SearchResultsPage).select_a_hotel
  (on HotelDetailsPage).click_on_book_now

  sleep 500

end

Given(/^I am on search details page$/) do
  visit BookAHotelPage
  (on BookAHotelPage).search_for_hotel
  sleep 500
end

When(/^I book a hotel on "([^"]*)" of "([^"]*)"$/) do |day, month_and_year|
  (on BookAHotelPage).search_for_hotel_on_date(day, month_and_year)
end

