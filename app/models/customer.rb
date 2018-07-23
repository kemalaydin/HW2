class Customer < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true ,length: {minimum: 3}
  validates :surname, presence: true, length: {minimum: 3}
  validates :email, confirmation: true


end
