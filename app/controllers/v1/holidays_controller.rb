module V1
  # Controller to return holidays based on different inputs
  class HolidaysController < ApplicationController
    # GET /holidays/all/:country
    def all
      if valid_country_code?(params[:country])
        country_code = params[:country]
      else
        country_code = country_to_code(params[:country])
        return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code
      end

      year_start = Date.new(Time.zone.today.year, 1, 1)
      year_end = Date.new(Time.zone.today.year, 12, 31)

      render json: Holidays.between(year_start, year_end, country_code.downcase.to_sym)
    end
  end
end
