module V1
  # Controller to return phone number info based on different locations
  class PhonesController < ApplicationController
    # GET /phones/country/:country
    def country
      country_code = country_param_validator(params[:country])
      return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code

      render json: { call_prefix: ISO3166::Country.new(country_code).country_code }
    end
  end
end
