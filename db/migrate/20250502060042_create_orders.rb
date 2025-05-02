class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :shipping_on, null: false
      t.string :time_slot, null: false
      t.string :status, null: false
      t.integer :billing_amount, null: false

      t.timestamps
    end
  end
end
