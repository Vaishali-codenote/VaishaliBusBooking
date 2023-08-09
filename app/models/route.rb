class Route < ApplicationRecord
  has_many :schedules
  has_many :buses,:through=> :schedules,dependent: :destroy
end
