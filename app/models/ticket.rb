class Ticket < ApplicationRecord
  belongs_to :bus
  belongs_to :user
  before_create :set_status

  def set_status
    self.status='confirm'
  end
end
