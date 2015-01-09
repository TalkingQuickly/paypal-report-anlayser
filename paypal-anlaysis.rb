require 'csv'
require 'pry'
require_relative './lib/transaction_list'
require_relative './lib/reporters/bank_payments.rb'

csv_text = File.read('data/data2.csv').encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
csv = CSV.parse(csv_text, :headers => true)

transactions = TransactionList.new(csv)

r = Reporters::BankPayments.new(transactions.bank_payments)

r.generate

binding.pry
