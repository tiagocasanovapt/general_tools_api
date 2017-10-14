require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/controllers/apidocs_controller.rb'
  add_filter 'app/controllers/v1/docs'
  add_filter 'app/models'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
