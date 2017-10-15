# Model for Phone results
class CurrencyModel
  include Swagger::Blocks

  swagger_schema :CurrencyModel do
    key :required, %i[html_entity iso_code iso_numeric name symbol]

    property :html_entity do
      key :type, :string
    end

    property :iso_code do
      key :type, :string
    end

    property :iso_numeric do
      key :type, :string
    end

    property :name do
      key :type, :string
    end

    property :symbol do
      key :type, :string
    end
  end

  swagger_schema :CurrencyConversionModel do
    key :required, %i[rate value formatted_value]

    property :rate do
      key :type, :integer
      key :format, :int32
    end

    property :value do
      key :type, :integer
      key :format, :int32
    end

    property :formatted_value do
      key :type, :string
    end
  end
end
