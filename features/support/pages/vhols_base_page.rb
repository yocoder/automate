require_relative 'footer'
class VholsBasePage
  include PageObject
  include PageObject::PageFactory
  include DataMagic
  include Footer

  attr_accessor :browser

  def initialize(browser, visit = false)
    super(browser, visit)
    wait_until(5, "correct page not loaded") { page_loaded_element.exists? }
  end

  def current_page?
    page_loaded_element.exists?
  end

end