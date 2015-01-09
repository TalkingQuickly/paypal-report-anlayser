class Transaction
  def initialize(data)
    @data = data
  end

  attr_accessor :data

  def amount
    data[" Gross"].gsub("-", "")
  end

  def type
    data[" Type"]
  end

  def name
    data[" Name"]
  end

  def time
    data[" Time"]
  end

  def date
    data["Date"]
  end

  def currency
    data[" Currency"]
  end
end
