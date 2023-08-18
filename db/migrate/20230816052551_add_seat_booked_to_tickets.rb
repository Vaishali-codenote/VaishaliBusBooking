class AddSeatBookedToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :seat_booked, :integer
  end
end
