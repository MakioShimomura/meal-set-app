class CreateMealKits < ActiveRecord::Migration[8.0]
  def change
    create_table :meal_kits do |t|
      t.references :plan, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.text :meal_content, null: false
      t.float :weight, null: false
      t.boolean :has_refrigerated, null: false, default: false
      t.boolean :has_frozen, null: false, default: false
      t.text :allergy_content

      t.timestamps
    end
  end
end
