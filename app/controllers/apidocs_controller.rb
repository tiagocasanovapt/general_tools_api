# Swagger docs controller for root
class ApidocsController < ApplicationController
  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '0.1.0'
      key :title, 'General Tools API'
      key :description, 'A sample API with a multitude of features ' \
                        'explained in the swagger-2.0 specification'
      key :termsOfService, 'http://helloreverb.com/terms/'
      contact do
        key :name, 'Tiago Casanova'
      end
      license do
        key :name, 'MIT'
        key :url, 'https://tldrlegal.com/license/mit-license'
      end
    end
    tag do
      key :name, 'timezones'
      key :description, 'Timezones operations'
    end
    key :host, 'general-tools-api.herokuapp.com'
    # key :basePath, '/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    TimezonesController,
    TimezoneModel,
    ErrorModel,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end