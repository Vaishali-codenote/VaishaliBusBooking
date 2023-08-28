class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :starting_city
      t.string :destination_city
      t.string :despeture_time
      t.string :bus_type
      t.string :arrival_time
      t.string :name
      t.string :number
      t.integer :price
      t.integer :total_seats
      t.integer :available_seats

      t.timestamps
    end
  end
end
