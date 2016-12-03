ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'database_cleaner'
require 'capybara/dsl'
require 'time'

Capybara.app = BikeShareApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.include Capybara::DSL
end
