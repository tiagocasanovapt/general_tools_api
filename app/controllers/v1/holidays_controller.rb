module V1
  # Controller to return holidays based on different inputs
  class HolidaysController < ApplicationController
    # GET /holidays/country/:country
    def country
      if valid_country_code?(params[:country])
        country_code = params[:country]
      else
        country_code = country_to_code(params[:country])
        return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code
      end

      render json: Holidays.on(Time.zone.today, country_code.downcase.to_sym)
    end
  end
end
