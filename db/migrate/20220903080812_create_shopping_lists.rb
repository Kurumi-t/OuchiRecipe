class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.integer :post_recipe_id, null: false
      t.integer :user_id, null: false
      t.integer :food_id, null: false
      t.decimal :amount, null: false
      t.timestamps
    end
  end
end
