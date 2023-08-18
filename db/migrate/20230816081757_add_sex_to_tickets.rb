class AddSexToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :sex, :string
  end
end
