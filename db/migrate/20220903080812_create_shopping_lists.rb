class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.integer :ingredient_id
      t.integer :fridge_id
      t.integer :user_id
      t.string :food_name
      t.decimal :amount
      t.timestamps
    end
  end
end
