class Ticket < ApplicationRecord
  belongs_to :bus
  belongs_to :route
  belongs_to :user
end