require_relative 'vhols_base_page'
class GuestDetailsPage < VholsBasePage

  select_list :lead_guest_title, id: 'leadPassenger.personName.title'
  text_field :lead_guest_firstname, id: 'leadPassenger.personName.foreName'
  text_field :lead_guest_lastname, id: 'leadPassenger.personName.surname'

  select_list :lead_guest_dob_day, id: 'lead-dob-day'
  select_list :lead_guest_dob_month, id: 'lead-dob-month'
  select_list :lead_guest_dob_year, id: 'lead-dob-year'


  select_list :adult_guest2_title, id: 'passengers[0].personName.title'
  text_field :adult_guest2_firstname, id: 'passengers0.personName.foreName'
  text_field :adult_guest2_lastname, id:'passengers0.personName.surname'

  select_list :adult_guest2_dob_day, xpath: "//*[@id='main-content']/div/div/div[9]/form/div[3]/div[3]/div/div[2]/div/div[2]/div[5]/div[2]/div[1]/select"
  select_list :adult_guest2_dob_month, xpath: "//*[@id='main-content']/div/div/div[9]/form/div[3]/div[3]/div/div[2]/div/div[2]/div[5]/div[2]/div[2]/select"
  select_list :adult_guest2_dob_year, xpath: "//*[@id='main-content']/div/div/div[9]/form/div[3]/div[3]/div/div[2]/div/div[2]/div[5]/div[2]/div[3]/select"

  text_field :email, id:'leadPassenger.profile.preferredEmail.address'
  text_field :postcode, id:'leadPassenger.profile.homeAddress.postCode'
  link :look_up_address , text:'Look up address'

  text_field :postcode, id:'leadPassenger.profile.homeAddress.postCode'
  text_field :phone_number, name:'leadPassenger.profile.preferredTelephoneNumber.number'

  checkbox :i_confirm, id:'confirm-input'
  button :continue_to_payment, name:'_eventId_submitPayment'
  select_list :postcode_select , class: 'postcode-select'
  list_item :address , xpath: "//*[@id='pc-removable-0']"

  def page_loaded_element
    lead_guest_title_element
  end

  def fill_guest_details(data = {})
    populate_page_with data_for(:guest_details_page, data)
    name = lead_guest_firstname
    look_up_address
    sleep 3
    self.postcode_select = postcode_select_options[1]
    check_i_confirm
    continue_to_payment
    name
  end


end