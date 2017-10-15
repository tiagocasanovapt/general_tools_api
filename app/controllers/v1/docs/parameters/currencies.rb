module V1
  module Docs
    module Parameters
      # Documentation for Currencies Parameters
      class Currencies
        class << self
          def amount
            proc do
              key :name, :amount
              key :in, :query
              key :description, 'Amount to be converted'
              key :required, true
              key :type, :integer
              key :format, :int64
            end
          end

          def orig_curr
            proc do
              key :name, :orig_curr
              key :in, :query
              key :description, 'ISO code of the current currency of the amount'
              key :required, true
              key :type, :string
            end
          end

          def dest_curr
            proc do
              key :name, :dest_curr
              key :in, :query
              key :description, 'ISO code of the currency to convert the amount'
              key :required, true
              key :type, :string
            end
          end
        end
      end
    end
  end
end
