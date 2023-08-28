class Bus < ApplicationRecord
  validates :name, :number, presence: true, uniqueness: true

  has_many :tickets, dependent: :destroy
  has_many :routes
end
