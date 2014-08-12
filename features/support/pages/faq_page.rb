require_relative 'vhols_base_page'
class FaqPage < VholsBasePage

  page_url "#{EnvConfig["base_url"]}#{EnvConfig["faq_page"]}"

  link :faqs_link, text: 'faqs'

  def page_loaded_element
    faqs_link_element
  end



end