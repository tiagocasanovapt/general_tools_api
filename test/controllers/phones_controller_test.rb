require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  test 'should get the country phone call prefix' do
    get '/v1/phones/country/PT'
    assert_response :success

    assert_not_nil(response.body)

    result = JSON.parse(response.body)
    assert_equal result.dig('call_prefix'), '351'
  end
end
