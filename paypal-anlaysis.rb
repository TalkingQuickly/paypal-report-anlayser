require 'csv'
require 'pry'
require_relative './lib/transaction_list'

csv_text = File.read('data/data2.csv').encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
csv = CSV.parse(csv_text, :headers => true)

transactions = TransactionList.new(csv)

binding.pry
