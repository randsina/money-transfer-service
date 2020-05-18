# frozen_string_literal: true

require 'minitest/autorun'

class TestTransferService < Minitest::Test
  def setup
    @sender = User.find(1) # assume a user with the balance 200.01
    @reciever = User.find(2)
    @amount = 100
  end

  def test_that_money_transfer_successful
    sender_money_before_payment = @sender.balance
    reciever_money_before_payment = @reciever.balance
    TransferService.call(@sender.id, @reciever.id, @amount)
    @sender.reload
    @reciever.reload
    assert_equal sender_money_before_payment - @amount, @sender.balance
    assert_equal reciever_money_before_payment + @amount, @reciever.balance
  end

  def test_that_balance_positive
    @amount = 1_000
    sender_money_before_payment = @sender.balance
    TransferService.call(@sender.id, @reciever.id, @amount)
    @sender.reload
    assert_equal sender_money_before_payment, @sender.balance
  end

  def test_that_it_successful_with_decimal_value
    @amount = 0.02
    sender_money_before_payment = @sender.balance
    TransferService.call(@sender.id, @reciever.id, @amount)
    @sender.reload
    assert_equal sender_money_before_payment - @amount, @sender.balance
  end
end
