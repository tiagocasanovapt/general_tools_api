# Model for Timezone results
class TimezoneModel
  include Swagger::Blocks

  swagger_schema :TimezoneModel do
    key :required, %i[timezone offset]

    property :timezone do
      key :type, :string
    end

    property :offset do
      key :type, :integer
      key :format, :int32
    end
  end
end
