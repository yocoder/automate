require_relative 'vhols_base_page'
class PaymentPage < VholsBasePage
  div :secure_div, class: 'secure-payment'
  link :submit_payment, text: 'Submit payment'


  in_iframe(:id => 'acsFrame') do |frame|
    text_field(:card_number, :name => 'card_number', :frame => frame)
    text_field(:name_on_card, :name => 'capf1', :frame => frame)
    select_list(:expiry_month, :name => 'exp_month', :frame => frame)
    select_list(:expiry_year, :name => 'exp_year', :frame => frame)
    text_field(:security_code, :name => 'cv2_number', :frame => frame)
    link(:submit, :id => 'submitBtn', :frame => frame)
  end


  def page_loaded_element
    secure_div_element
  end

  def submit_card_details
    self.card_number = '4444333322221111'
    self.name_on_card = 'Test'
    self.expiry_month = '02'
    self.expiry_year = '2015'
    self.security_code ='222'
    self.submit
    wait_until(5) { submit_payment_element.exists? }
    submit_payment
  end


end