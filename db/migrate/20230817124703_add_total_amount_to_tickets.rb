class AddTotalAmountToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :tot_amount, :integer
  end
end
