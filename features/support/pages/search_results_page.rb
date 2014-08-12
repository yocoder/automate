require_relative 'vhols_base_page'
class SearchResultsPage < VholsBasePage

  page_url "#{EnvConfig["base_url"]}"


  link :more_details, class: 'btn btn-primary progress-cont'

  def page_loaded_element
    more_details_element
  end

  def select_a_hotel
    more_details
  end

  def scroll_down
    @browser.execute_script("window.scrollBy(0,4096)")
  end

  def click_back_to_top
    self.back_to_top_btn
    wait_until(5) { book_a_hotel_header_link_element.exists? }
  end

  def flying_club_miles
    hotel_price_without_pound = (hotel_price_elements[1].text)[1..-1]
    puts browser.text.include? 'Earn' + hotel_price_without_pound + 'Flying club miles'
  end

end