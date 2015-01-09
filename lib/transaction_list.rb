require_relative './transaction'
require_relative './transaction_group'

class TransactionList
  def initialize(data)
    @data = data
  end

  attr_accessor :data

  def transaction_list
    @transaction_list ||= data.collect do |d|
      Transaction.new(d)
    end
  end

  def transaction_groups
    @tg ||= transaction_list.group_by do |t|
      t.time
    end.collect do |t|
      TransactionGroup.new(t[1])
    end
  end

  def bank_payments
    @bp ||= transaction_groups.select do |t|
      t.is_bank_payment?
    end
  end
end
