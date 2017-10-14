module V1
  module Docs
    # Documentation for PhonesController
    class Phones
      include Swagger::Blocks

      swagger_path '/phones/country/{country}' do
        operation :get do
          key :description, 'Returns phone call prefix for a country'
          key :operationId, 'findPhoneBycountry'
          key :tags, ['Phones']

          parameter(&Parameters::Generic.country)

          response 200 do
            key :description, 'Country response'
            schema do
              key :'$ref', :PhoneModel
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
