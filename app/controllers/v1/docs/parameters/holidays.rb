module V1
  module Docs
    module Parameters
      # Documentation for Holidays Parameters
      class Holidays
        class << self
          def country
            proc do
              key :name, :country
              key :in, :path
              key :description, 'Name / Code of country to fetch'
              key :required, true
              key :type, :string
            end
          end

          def start_date
            proc do
              key :name, :start_date
              key :in, :body
              key :description, 'Start date to search for'
              key :required, true
              key :type, :string
              key :format, :date
            end
          end

          def end_date
            proc do
              key :name, :end_date
              key :in, :body
              key :description, 'End date to search for'
              key :required, true
              key :type, :string
              key :format, :date
            end
          end
        end
      end
    end
  end
end
