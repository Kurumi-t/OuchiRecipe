class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.integer :ingredient_id
      t.integer :user_id, null: false
      t.string :food_name, null: false
      t.decimal :amount, null: false
      t.string :unit, null: false
      t.timestamps
    end
  end
end
