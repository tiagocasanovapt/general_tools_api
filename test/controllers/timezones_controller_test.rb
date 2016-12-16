class TimezonesControllerTest < ActionDispatch::IntegrationTest
  test 'should get city timezone' do
    get '/timezones/Porto'
    assert_response :success

    assert_not_nil(response.body)

    result = JSON.parse(response.body)
    assert_equal(result['timezone'], 'Europe/Lisbon')
  end
end
