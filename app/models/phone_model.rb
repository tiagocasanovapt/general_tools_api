# Model for Phone results
class PhoneModel
  include Swagger::Blocks

  swagger_schema :PhoneModel do
    key :required, %i[call_prefix]

    property :call_prefix do
      key :type, :string
    end
  end
end
