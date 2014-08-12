require_relative 'vhols_base_page'
class HotelDetailsPage < VholsBasePage

  link :book_now, text: 'Book now'

  def page_loaded_element
    book_now_element
  end

  def click_on_book_now
    book_now
  end

end