class TransactionGroup
  def initialize(data)
    @data = data
  end

  attr_accessor :data

  def is_payment?
    !data.select {|d| d.type.include? "Payment Sent"}.empty?
  end

  def is_payment_received?
    !data.select {|d| d.type.include? "Payment Received"}.empty?
  end

  def is_bank_payment?
    !data.select {|d| d.type.include? "Add Funds from a Bank Account"}.empty?
  end

  def has_currency_conversion?
    !data.select {|d| d.type.include? "Currency Conversion"}.empty?
  end

  def is_paypal_balance_payment?
    is_payment? && !is_bank_payment?
  end

  def to_csv
    case
    when is_bank_payment? && has_currency_conversion?
      [
        data.first.date,
        data.first.name,
        data.last.amount,
        data.last.currency,
        data.first.amount,
        data.first.currency
      ]
    when is_bank_payment? && !has_currency_conversion?
      [
        data.first.date,
        data.first.name,
        data.last.amount,
        data.last.currency
      ]
    end
  end
end

