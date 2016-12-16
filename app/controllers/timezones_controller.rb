# Controller to return a timezone based on different locations
class TimezonesController < ApplicationController
  # GET /timezones/:city
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
end
