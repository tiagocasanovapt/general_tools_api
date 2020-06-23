require 'swagger_helper'

RSpec.describe 'TimezonesController', type: :request do

  # path '/v1/timezones/city/{city}' do
  #   get 'Returns a single timezone for the city' do
  #     tags 'Timezones'
  #     operationId 'findTimezoneByCity'
  #     produces 'application/json', 'application/xml'
  #     parameter name: :city, in: :path, type: :string

  #     response '200', 'Timezones found' do
  #       schema type: :array,
  #         items: {
  #           properties: {
  #             timezone: { type: :string },
  #             offset: { type: :integer, format: :int32 }
  #           }
  #         }

  #       let(:city) { 'Lisbon' }
  #       run_test!
  #     end

  #     response '404', 'City not found' do
  #       let(:city) { 'AAA' }
  #       run_test!
  #     end
  #   end
  # end

  path '/v1/timezones/country/{country}' do
    get 'Returns all the remaining timezones for a country' do
      tags 'Timezones'
      operationId 'findTimezoneByCountry'
      produces 'application/json', 'application/xml'
      parameter name: :country, in: :path, type: :string

      response '200', 'Timezones found' do
        schema type: :array,
          items: {
            properties: {
              timezone: { type: :string },
              offset: { type: :integer, format: :int32 }
            }
          }

        let(:country) { 'PT' }
        run_test!
      end

      response '404', 'Country not found' do
        let(:country) { 'AAA' }
        run_test!
      end
    end
  end

  # path '/v1/timezones/gps' do
  #   get 'Returns a single timezone for the GPS coordinates' do
  #     tags 'Timezones'
  #     operationId 'findTimezoneByGPS'
  #     produces 'application/json', 'application/xml'
      
  #     parameter name: :lat, in: :query, type: :integer, format: :int64, required: true, description: 'Latitude of location'
  #     parameter name: :lon, in: :query, type: :integer, format: :int64, required: true, description: 'Longitude of location'

  #     response '200', 'Timezones found' do
  #       schema type: :array,
  #         items: {
  #           properties: {
  #             timezone: { type: :string },
  #             offset: { type: :integer, format: :int32 }
  #           }
  #         }

  #       let(:lat) { 41.149968 }
  #       let(:lon) { -8.610243 }
  #       run_test!
  #     end

  #     response '404', 'City not found' do
  #       let(:lat) { 'AAA' }
  #       let(:lon) { 'BBB' }
  #       run_test!
  #     end
  #   end
  # end

end
