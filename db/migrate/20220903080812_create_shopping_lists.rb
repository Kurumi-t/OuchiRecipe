class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.integer :post_recipe_id
      t.integer :user_id
      t.integer :food_id
      t.decimal :amount
      t.timestamps
    end
  end
end
