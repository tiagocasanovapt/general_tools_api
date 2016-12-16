# helper methods related with countries' names and codes
module CountryHelpers
  extend ActiveSupport::Concern

  def valid_country_code?(country_code)
    return false unless country_code
    TZInfo::Country.all_codes.include?(country_code)
  end

  def valid_country?(country)
    TZInfo::Country.all.find { |tz_info| tz_info.name == country }.present?
  end

  def country_to_code(country)
    TZInfo::Country.all.find { |tz_info| tz_info.name == country }.code if valid_country? country
  end
end
