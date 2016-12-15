class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :last_known_location, presence: true
  validates :account_balance, presence: true, numericality: true
end
