module V1
  module Docs
    # Documentation for HolidaysController
    class Holidays
      include Swagger::Blocks

      swagger_path '/holidays/all/{country}' do
        operation :get do
          key :description, 'Returns all the yearly holidays for a country'
          key :operationId, 'findAllHolidaysByCountry'
          key :tags, ['Holidays']

          parameter(&Parameters::Generic.country)

          response 200 do
            key :description, 'Holiday response'
            schema do
              key :'$ref', :HolidayModel
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

      swagger_path '/holidays/remaining/{country}' do
        operation :get do
          key :description, 'Returns all the remaining holidays for a country'
          key :operationId, 'findRemainingHolidaysByCountry'
          key :tags, ['Holidays']

          parameter(&Parameters::Generic.country)

          response 200 do
            key :description, 'Holiday response'
            schema do
              key :'$ref', :HolidayModel
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

      swagger_path '/holidays/between/{country}' do
        operation :post do
          key :description, 'Returns all the holidays for a country between two given dates'
          key :operationId, 'findHolidaysByCountryBetweenDates'
          key :tags, ['Holidays']

          parameter(&Parameters::Generic.country)
          parameter(&Parameters::Holidays.start_date)
          parameter(&Parameters::Holidays.end_date)

          response 200 do
            key :description, 'Holiday response'
            schema do
              key :'$ref', :HolidayModel
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
