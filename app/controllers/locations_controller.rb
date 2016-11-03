# Controller to return a timezone based on different locations
class LocationsController < ApplicationController
  # GET /locations/:city
  def city
    res = Geokit::Geocoders::GoogleGeocoder.geocode(params[:city] || '')
    google_timezone = GoogleTimezone.fetch(res.latitude, res.longitude)
    timezone = TZInfo::Timezone.get(google_timezone.time_zone_id)

    render json: { timezone: timezone.name.to_s }
  end
end
