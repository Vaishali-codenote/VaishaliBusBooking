class CreateTrasactions < ActiveRecord::Migration[7.0]
  def change
    create_table :trasactions do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_type
      t.text :description

      t.timestamps
    end
  end
end
