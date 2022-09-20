class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer :post_recipe_id, null: false
      t.string :food_name, null: false
      t.string :unit
      t.decimal :amount
      t.string :other_amount
      t.timestamps
    end
  end
end
