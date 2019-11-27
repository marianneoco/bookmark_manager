# frozen_string_literal: true

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
    # Want a nice code coverage website? Uncomment this next line!
    # SimpleCov::Formatter::HTMLFormatter
    ])
SimpleCov.start

# For accurate test coverage measurements, require your code
# AFTER 'SimpleCov.start'

RSpec.configure do |config|
  config.before(:each) do
    require 'setup_test_database_helper.rb'
    clear_table
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve
     your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

# tell Capybara about our app class
Capybara.app = BookmarkApp
