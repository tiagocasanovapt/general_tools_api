# Main controller
class ApplicationController < ActionController::API
  include CountryHelpers
  include CurrencyHelpers
  include Swagger::Blocks
end
