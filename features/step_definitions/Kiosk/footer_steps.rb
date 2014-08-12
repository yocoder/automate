When(/^I click on Contact Us$/) do
  (on BookAHotelPage).click_on_contactus
end

Then(/^I should see Contact Us Page$/) do
  (on ContactUsPage).current_page?
end