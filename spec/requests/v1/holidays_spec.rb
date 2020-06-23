require 'swagger_helper'

RSpec.describe 'HolidaysController', type: :request do

  path '/v1/holidays/all/{country}' do
    get 'Returns all the yearly holidays for a country' do
      tags 'Holidays'
      operationId 'findAllHolidaysByCountry'
      produces 'application/json', 'application/xml'
      parameter name: :country, in: :path, type: :string

      response '200', 'Holidays found' do
        schema type: :array,
          items: {
            properties: {
              date: { type: :string, format: :date },
              name: { type: :string },
              regions: { type: :array, items: { type: :string } }
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

  path '/v1/holidays/remaining/{country}' do
    get 'Returns all the remaining holidays for a country' do
      tags 'Holidays'
      operationId 'findRemainingHolidaysByCountry'
      produces 'application/json', 'application/xml'
      parameter name: :country, in: :path, type: :string

      response '200', 'Holidays found' do
        schema type: :array,
          items: {
            properties: {
              date: { type: :string, format: :date },
              name: { type: :string },
              regions: { type: :array, items: { type: :string } }
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

  path '/v1/holidays/between/{country}' do
    post 'Returns all the remaining holidays for a country' do
      tags 'Holidays'
      operationId 'findRemainingHolidaysByCountry'
      produces 'application/json', 'application/xml'
      
      parameter name: :country, in: :path, type: :string
      parameter name: :start_date, in: :body, type: :string, format: :date, required: true, description: 'Start date to search for'
      parameter name: :end_date, in: :body, type: :string, format: :date, required: true, description: 'End date to search for'

      # TODO: https://github.com/rswag/rswag/issues/320
      # 
      # response '200', 'Holidays found' do
      #   schema type: :array,
      #     items: {
      #       properties: {
      #         date: { type: :string, format: :date },
      #         name: { type: :string },
      #         regions: { type: :array, items: { type: :string } }
      #       }
      #     }

      #   let(:country) { 'PT' }
      #   let(:start_date) { Date.new(2017, 10, 1).to_s }
      #   let(:end_date) { Date.new(2017, 10, 31).to_s }
      #   run_test!
      # end

      response '404', 'Country not found' do
        let(:country) { 'AAA' }
        run_test!
      end
    end
  end

end
