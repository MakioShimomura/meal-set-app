class AddToShippingScheduleToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :shipping_schedule, :string
  end
end
