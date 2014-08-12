# Before each scenario, except headless and manual ones

# Set up browser
b = 'firefox' # default to firefox
b = ENV['BROWSER'] unless ENV['BROWSER'].nil?

browser = Watir::Browser.new(b.to_sym)

Before('~@headless', '~@manual') do
  @browser = browser
  browser.window.resize_to(1300, 800)
  browser.cookies.clear
end

# After each scenario, except headless and manual ones
After('~@headless', '~@manual') do |scenario|

  @browser.driver.manage.delete_all_cookies

  # Output a screenshot if the scenario failed
  if scenario.failed?

    output_path = File.expand_path(File.dirname(__FILE__) + '/../../results/screenshots/')
    scenario_name = scenario.to_sexp[3].gsub(/[^\w\-]/, ' ') + " #{Time.now.strftime("%d-%m-%y %H.%M.%S")}"
    output_path += '/' + scenario_name + '.png'

    @browser.driver.save_screenshot(output_path)
    encoded_img = @browser.driver.screenshot_as(:png)
    embed("data:image/png;base64,#{encoded_img}", 'image/png')

    puts scenario_name
    puts "Screenshot saved to #{output_path}"
  end
end

# After all features have executed
at_exit do
  #headless.destroy
  browser.close
end
