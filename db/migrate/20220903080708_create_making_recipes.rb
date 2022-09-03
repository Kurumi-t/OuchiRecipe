class CreateMakingRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :making_recipes do |t|
      t.integer :post_recipe_id, null: false
      t.text :recipe, null: false
      t.timestamps
    end
  end
end
