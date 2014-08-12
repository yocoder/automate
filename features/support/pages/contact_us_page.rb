require_relative 'vhols_base_page'
class ContactUsPage < VholsBasePage

  page_url "#{EnvConfig["base_url"]}#{EnvConfig["contact_us_page"]}"

   link :contact_us_navigation, xpath:"//*[@id='navbar-collapsable']/div/ol/li[2]/a"

  def page_loaded_element
    contact_us_navigation_element
  end

end