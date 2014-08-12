require_relative 'vhols_base_page'
class BookAHotelPage < VholsBasePage

  page_url "#{EnvConfig["base_url"]}#{EnvConfig["book_a_hotel"]}"

  span :testw, class: 'title ng-binding'

  div :checkin_cal, id: "checkin-date-open"
  div :checkout_cal, id:'checkout-date-open'
  select_list :month_year_list, xpath: "//*[@id='book-a-hotel']/div[2]/div/div/div[2]/div/div[2]/div/select"
  select_list :checkout_month_year_list, xpath:"//*[@id='book-a-hotel']/div[3]/div/div/div[2]/div/div[2]/div/select"
  text_field :search_box, id: 'searchTerm'
  text_field :check_in, id: 'checkin-date'
  text_field :check_out, id:'checkout-date'
  button :submit, text: 'Submit'
  links :suggestions, class: 'suggestion ng-scope ng-binding'
  link :book_a_hotel_header_link, text: 'book a hotel'
  button :cdate, text:'05'

  def page_loaded_element
    search_box_element
  end

  def search_for_hotel
    self.search_box = 'Orlando'
    sleep 2
    suggestions_elements[2].click
    sleep 2
    self.submit
    wait_until(5) { book_a_hotel_header_link_element.exists? }

  end

  def search_for_hotel_on_date(day, month_and_year)
    day = day.chop.chop!
    short_month = month_and_year[0..2]
    month_and_year = short_month.to_s + " " + month_and_year.split(//).last(4).join("").to_s
    self.search_box = 'Orlando'
    sleep 2
    suggestions_elements[2].click
    sleep 2
    checkin_cal_element.click
    self.month_year_list = month_and_year
    date = @browser.button :text =>day
    date.click
    puts check_in

=begin
#Checkout date code
    puts check_out_date = Time.date_parse(check_in) + duration.to_i
    check_out_month_and_year = check_out_date.strftime('%b %Y')
    checkout_cal_element.click
    self.checkout_month_year_list = check_out_month_and_year
    puts  check_out_day = check_out_date.strftime('%d')
    sleep 4
    cdate = @browser.button :text => check_out_day
    cdate.click
    cdate
    sleep 2
    puts check_out_date
    sleep 100
=end
  end
  def click_on_contactus
    contact_us
  end

end
