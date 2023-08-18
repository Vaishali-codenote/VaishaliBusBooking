class Route < ApplicationRecord
  validates :from, :to, presence: true
  belongs_to :bus
  
end
