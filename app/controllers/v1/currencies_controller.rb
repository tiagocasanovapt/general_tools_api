module V1
  # Controller to return currency info based on different params
  class CurrenciesController < ApplicationController
    # GET /currencies/country/:country
    def country
      country_code = country_param_validator(params[:country])
      return render json: { error: 'Country Not Found' }.to_json, status: 404 unless country_code

      currency = ISO3166::Country.new(country_code).currency
      render json: currency.instance_values.symbolize_keys.slice(:iso_numeric, :iso_code, :html_entity, :symbol, :name)
    end

    # GET /currencies/converter?:orig_curr&:dest_curr&:amount
    def converter
      orig_curr, dest_curr = currency_param_validator(params[:orig_curr], params[:dest_curr])
      return render json: { error: 'Origin/Destination Currency Not Found' }.to_json, status: 404 unless orig_curr && dest_curr

      result = convert_money(params[:amount], orig_curr, dest_curr)

      render json: {
        rate: currency_rate(result),
        value: result.to_f,
        formatted_value: result.format
      }
    end
  end
end
