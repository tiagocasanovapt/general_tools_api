module V1
  module Docs
    # Documentation for TimezonesController
    class Timezones
      include Swagger::Blocks

      swagger_path '/timezones/city/{city}' do
        operation :get do
          key :description, 'Returns a single timezone for the city'
          key :operationId, 'findTimezoneByCity'
          key :tags, ['Timezones']
          parameter do
            { name: :city, in: :path, description: 'Name of city to fetch', required: true, type: :string }
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

      swagger_path '/timezones/country/{country}' do
        operation :get do
          key :description, 'Returns all timezones for a country'
          key :operationId, 'findTimezoneBycountry'
          key :tags, ['Timezones']
          parameter do
            { name: :country, in: :path, description: 'Name of country to fetch', required: true, type: :string }
          end
          response 200 do
            key :description, 'Country response'
            schema do
              key :type, :array
              items { key :'$ref', :TimezoneModel }
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

      swagger_path '/timezones/gps' do
        operation :get do
          key :description, 'Returns a single timezone for the GPS coordinates'
          key :operationId, 'findTimezoneByGPS'
          key :tags, ['Timezones']
          parameter do
            { name: :lat, in: :query, description: 'Latitude of location', required: true, type: :integer, format: :int64 }
          end
          parameter do
            { name: :lng, in: :query, description: 'Longitude of location', required: true, type: :integer, format: :int64 }
          end
          response 200 do
            key :description, 'GPS response'
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
    end
  end
end
