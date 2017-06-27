# Main controller
class ApplicationController < ActionController::API
  include CountryHelpers
  include Swagger::Blocks
end
