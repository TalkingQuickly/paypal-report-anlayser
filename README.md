# Paypal Report Generator

## Why

Paying with Paypal makes reporting, in particular transaction matching a nightmare. For example if you have a bank account in GBP and you make a payment in USD, this will simply show up as "PAYPAL" on the bank statement and because of the currency conversion there's no easy way to match the payment back to an invoice.

On the report exported from Paypal, this will show up as four separate transactions:

* Pre-approved Payment Sent (USD)
* Currency Conversion (USD)
* Currency Conversion (GBP)
* Add Funds from a Bank Account (GBP)

Helpfully they don't even provide a unique identifier for linking these transactions to one another.

In order to work out which transaction is which on the bank statement, it is neccersary to combine these transactions into one line, showing the invoice amount in the original currency alongside the amount which was actually charged in the bank accounts currency.

## How

Payments can be easily grouped using the time they ocurred as the time will be identical for all four transactions.

These groups are then analysed, condensed down into a single line and then exported to a csv file. This file can be used to quickly work out which transaction is which on a bank statement.

In addition the invoice amount can be used to reconcile back to a receipt management system (e.g. ReceiptBank) or Book Keeping system (e.g. Freshbooks).

## Usage

Coming soon once this has been converted into a gem.
