require 'spec_helper'

RSpec.describe "HolidaysControllerSpec", type: :request do
  it 'should get all country holidays' do
    get '/v1/holidays/all/PT'
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result.count, 13
    assert_equal result.first.dig('name'), 'Ano Novo'
    assert_equal result.last.dig('name'), 'Natal'
  end

  it 'should get remaining country holidays' do
    get '/v1/holidays/remaining/PT'
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result.last.dig('name'), 'Natal'
  end

  it 'should get country holidays between 2 dates' do
    post '/v1/holidays/between/PT', params: { start_date: Date.new(2017, 10, 1).to_s, end_date: Date.new(2017, 10, 31).to_s }
    assert_response :success

    expect(response.body).to be_truthy

    result = JSON.parse(response.body)
    assert_equal result.count, 1
    assert_equal result.first.dig('name'), 'Dia da República'
  end
end
