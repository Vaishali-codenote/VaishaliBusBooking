class Bus < ApplicationRecord
  has_many :tickets,dependent: :destroy
  has_many :schedules
  has_many :routes,:through=> :schedules
end
