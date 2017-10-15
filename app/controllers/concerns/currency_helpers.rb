# helper methods related with currencies codes
module CurrencyHelpers
  extend ActiveSupport::Concern

  def currency_param_validator(orig_curr, dest_curr)
    [orig_curr, dest_curr] if Money::Currency.include?(orig_curr) && Money::Currency.include?(dest_curr)
  end

  def convert_money(orig_value, orig_curr, dest_curr)
    amount = orig_value.to_f * Money::Currency.new(orig_curr).subunit_to_unit
    Money.new(amount, orig_curr).exchange_to(dest_curr)
  end

  def currency_rate(money)
    money.bank.store.get_rate(params[:orig_curr], params[:dest_curr]).to_f
  end
end
