module V1
  module Docs
    module Parameters
      # Documentation for Generic Parameters
      class Generic
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
        end
      end
    end
  end
end
