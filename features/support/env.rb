require 'fileutils'
require 'rspec'
require 'rspec-expectations'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'

# Test development and debugging gems
require 'pry'
require 'rubocop'

# Require the generic helpers in lib..
Dir[File.dirname(__FILE__) + '/../../lib/*.rb'].each { |f| require f }

World(PageObject)
World(PageObject::PageFactory)
