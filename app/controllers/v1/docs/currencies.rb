module V1
  module Docs
    # Documentation for CurrenciesController
    class Currencies
      include Swagger::Blocks

      swagger_path '/currencies/country/{country}' do
        operation :get do
          key :description, 'Returns currency info for a country'
          key :operationId, 'findCurrencyByCountry'
          key :tags, ['Currencies']

          parameter(&Parameters::Generic.country)

          response 200 do
            key :description, 'Currency response'
            schema do
              key :'$ref', :CurrencyModel
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

      swagger_path '/currencies/converter' do
        operation :get do
          key :description, 'Returns a numeric value converted from 1 currency to another'
          key :operationId, 'convertToCurrency'
          key :tags, ['Currencies']

          parameter(&Parameters::Currency.amount)
          parameter(&Parameters::Currency.orig_curr)
          parameter(&Parameters::Currency.dest_curr)

          response 200 do
            key :description, 'Currency response'
            schema do
              key :'$ref', :CurrencyModel
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
