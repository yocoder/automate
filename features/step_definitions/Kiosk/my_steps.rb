When(/^I book a car$/) do

end



When(/^I search for "([^"]*)"$/) do |arg|
  pending
end

When(/^I book a hotelll$/) do
puts @browser.title


@browser.text_field(:id, 'checkin-date').click
@title = @browser.div(:class, 'modal-content">')
puts @browser.select_list(:xpath, "//body[@id='book-a-hotel']/div[3]/div/div/div[2]/div/div[2]/div/select").options
@browser.select(:xpath, "//body[@id='book-a-hotel']/div[3]/div/div/div[2]/div/div[2]/div/select").select_value('Aug 2014')
@browser.table(:xpath, "//*[@id='book-a-hotel']/div[2]/div/div/div[3]/div/div/table").button(:text, '10').click


end