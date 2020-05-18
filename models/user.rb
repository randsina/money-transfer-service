# frozen_string_literal: true

# Table name: users
# id :integer
# name :string
# balance :decimal(16, 2)
# created_at :datetime
# updated_at :datetime
#
class User < ApplicationRecord
  validates :balance, numericality: true
  validate :balance_cannot_be_negative

  private

  def balance_cannot_be_negative
    if balance.present? && balance.negative?
      errors.add(:balance, "can't be less than 0")
    end
  end
end
