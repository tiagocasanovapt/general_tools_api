module V1
  # Controller to return holidays based on different inputs
  class HolidaysController < ApplicationController
    # Helper Constants
    YEAR_START = Date.new(Time.zone.today.year, 1, 1)
    YEAR_END = Date.new(Time.zone.today.year, 12, 31)

    # GET /holidays/all/:country
    def all
      country_code = country_param_validator(params[:country])
      return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code

      render json: Holidays.between(YEAR_START, YEAR_END, country_code.downcase.to_sym)
    end

    # GET /holidays/remaining/:country
    def remaining
      country_code = country_param_validator(params[:country])
      return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code

      render json: Holidays.year_holidays([country_code.downcase.to_sym])
    end

    # POST /holidays/between/:country
    def between; end
  end
end
