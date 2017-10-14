module V1
  module Docs
    module Parameters
      # Documentation for Holidays Parameters
      class Holidays
        class << self
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
