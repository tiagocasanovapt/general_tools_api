module V1
  module Docs
    module Parameters
      # Documentation for Timezones Parameters
      class Timezones
        class << self

          def city
            proc do
              key :name, :city
              key :in, :path
              key :description, 'Name of city to fetch'
              key :required, true
              key :type, :string
            end
          end

          def latitude
            proc do
              key :name, :lat
              key :in, :query
              key :description, 'Latitude of location'
              key :required, true
              key :type, :integer
              key :format, :int64
            end
          end

          def longitude
            proc do
              key :name, :lng
              key :in, :query
              key :description, 'Longitude of location'
              key :required, true
              key :type, :integer
              key :format, :int64
            end
          end

        end
      end
    end
  end
end
