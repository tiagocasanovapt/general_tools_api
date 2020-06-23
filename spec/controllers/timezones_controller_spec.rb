require 'spec_helper'

RSpec.describe "TimezonesControllerSpec", type: :request do
  it 'should get city timezone' do
    skip('Need to update Google Maps API')

    get '/v1/timezones/city/Porto'
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result['timezone'], 'Europe/Lisbon'
  end

  it 'should get GPS timezone' do
    skip('Need to update Google Maps API')

    get '/v1/timezones/gps?lat=41.149968&&lng=-8.610243'
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result['timezone'], 'Europe/Lisbon'
  end

  it 'should get Portugal timezones' do
    get '/v1/timezones/country/Portugal'
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result.size, 3
    assert_equal result[0]['timezone'], 'Europe/Lisbon'
    assert_equal result[1]['timezone'], 'Atlantic/Madeira'
    assert_equal result[2]['timezone'], 'Atlantic/Azores'
  end

  it 'should get PT timezones' do
    get '/v1/timezones/country/PT'
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result.size, 3
    assert_equal result[0]['timezone'], 'Europe/Lisbon'
    assert_equal result[1]['timezone'], 'Atlantic/Madeira'
    assert_equal result[2]['timezone'], 'Atlantic/Azores'
  end

  it 'should fail to obtain country timezones' do
    get '/v1/timezones/country/Portug'
    assert_response :not_found

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result['error'], 'Country Not Found'
  end
end
