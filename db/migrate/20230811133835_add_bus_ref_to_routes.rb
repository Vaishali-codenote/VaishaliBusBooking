class AddBusRefToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :routes, :bus, null: false, foreign_key: true
  end
end
