require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  test 'should get the country currency information' do
    get '/v1/currencies/country/PT'
    assert_response :success

    assert_not_nil(response.body)

    result = JSON.parse(response.body)

    assert_equal result.dig('iso_numeric'), '978'
    assert_equal result.dig('iso_code'), 'EUR'
    assert_equal result.dig('symbol'), '€'
    assert_equal result.dig('name'), 'Euro'
  end

  test 'should convert the amount correctly' do
    # test rate for EUR/USD
    Money.add_rate('EUR', 'USD', 1.1)

    get '/v1/currencies/converter?amount=1.00&orig_curr=EUR&dest_curr=USD'
    assert_response :success

    assert_not_nil(response.body)

    result = JSON.parse(response.body)

    assert_equal result.dig('rate'), 1.1
    assert_equal result.dig('value'), 1.1
    assert_equal result.dig('formatted_value'), '$1.10'
  end
end
