require_relative 'vhols_base_page'
class ConfirmationPage < VholsBasePage

div :booking_reference_number, id:'book-ref'


  def page_loaded_element
    booking_reference_number_element
  end

  def guest_booking_confirmed(first_name)

    puts booking_reference_number
    puts first_name
       @browser.text.include? first_name
  end

end