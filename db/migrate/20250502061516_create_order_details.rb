class CreateOrderDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :meal_kit, null: false, foreign_key: true
      t.boolean :has_frozen, default: false, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
