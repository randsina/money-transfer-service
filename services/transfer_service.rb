# frozen_string_literal: true

class TransferService
  def self.call(from_user_id, to_user_id, amount)
    User.transaction do
      sender = User.find(from_user_id)
      receiver = User.find(to_user_id)
      sender.lock!
      receiver.lock!
      sender.balance -= amount
      sender.save!
      receiver.balance += amount
      receiver.save!
    end
  end
end
