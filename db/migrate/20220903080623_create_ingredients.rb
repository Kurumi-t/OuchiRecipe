class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer :food_id, null: false
      t.integer :post_recipe_id, null: false
      t.decimal :amount, null: false
      t.string :other_amount
      t.timestamps
    end
  end
end
