class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :bus, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :name
      t.string :age
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
