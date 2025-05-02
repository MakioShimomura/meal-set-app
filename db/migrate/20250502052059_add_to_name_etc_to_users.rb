class AddToNameEtcToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
    add_column :users, :suspended, :boolean, null: false, default: false
    add_reference :users, :plan, foreign_key: true
  end
end
