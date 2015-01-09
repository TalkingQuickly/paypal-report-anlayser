require 'csv'

module Reporters
  class BankPayments
    def initialize(transaction_groups)
      @transaction_groups ||= transaction_groups
    end

    attr_accessor :transaction_groups

    def generate(output='report.csv')
      CSV.open(output, "w") do |csv|
        csv << [
          "Date",
          "Name",
          "Bank Amount",
          "Bank Currency",
          "Invoice Amount",
          "Invoice Currency"
        ]
        transaction_groups.each do |t|
          csv << t.to_csv
        end
      end
    end
  end
end
