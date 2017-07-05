# Controller to return a timezone based on different locations
class TimezonesController < ApplicationController
  swagger_path '/timezones/city/{city}' do
    operation :get do
      key :description, 'Returns a single timezone for the city'
      key :operationId, 'findTimezoneByCity'
      key :tags, [
        'Timezones'
      ]
      parameter do
        key :name, :city
        key :in, :path
        key :description, 'Name of city to fetch'
        key :required, true
        key :type, :string
      end
      response 200 do
        key :description, 'City response'
        schema do
          key :'$ref', :TimezoneModel
        end
      end
      response :default do
        key :description, 'Unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

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
    if valid_country_code?(params[:country])
      country_code = params[:country]
    else
      country_code = country_to_code(params[:country])
      return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code
    end

    render json: timezone_countries_result(country_code)
  end

  private

  def timezone_countries_result(country_code)
    TZInfo::Country.get(country_code).zones.map do |zone|
      { timezone: zone.name.to_s, offset: zone.current_period.utc_offset / 3600 }
    end
  end
end
