class HolidayModel
  include Swagger::Blocks

  swagger_schema :HolidayModel do
    key :required, %i[date name regions]

    property :date do
      key :type, :string
      key :format, :date
    end

    property :name do
      key :type, :string
    end
    
    property :regions do
      key :type, :array
      items do
        key :type, :string
      end
    end
  end
end
