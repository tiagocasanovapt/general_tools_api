module V1
  # Controller to return a timezone based on different locations
  class TimezonesController < ApplicationController
    # GET /timezones/city/:city
    def city
      res = Geokit::Geocoders::GoogleGeocoder.geocode(params[:city] || '')
      google_timezone = GoogleTimezone.fetch(res.latitude, res.longitude)
      timezone = TZInfo::Timezone.get(google_timezone.time_zone_id)

      result = {
        timezone: timezone.name.to_s,
        offset: timezone.current_period.utc_offset / 3600
      }

      render json: result
    end

    # GET /timezones/country/:country
    def country
      country_code = country_param_validator(params[:country])
      return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code

      render json: timezone_countries_result(country_code)
    end

    # GET /timezones/gps?:lat&:lng
    def gps
      google_timezone = GoogleTimezone.fetch(params[:lat], params[:lng])
      timezone = TZInfo::Timezone.get(google_timezone.time_zone_id)

      result = {
        timezone: timezone.name.to_s,
        offset: timezone.current_period.utc_offset / 3600
      }

      render json: result
    end

    private

    def timezone_countries_result(country_code)
      TZInfo::Country.get(country_code).zones.map do |zone|
        { timezone: zone.name.to_s, offset: zone.current_period.utc_offset / 3600 }
      end
    end
  end
end
