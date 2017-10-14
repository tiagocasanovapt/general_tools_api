require 'simplecov'

SimpleCov.start do
  # from bin/rails
  add_filter '/bin/'
  add_filter { |source_file| source_file.lines.count <= 5 }
  # from bin/rails

  add_filter 'app/controllers/apidocs_controller.rb'
  add_filter 'app/controllers/v1/docs'
  add_filter 'app/models'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
