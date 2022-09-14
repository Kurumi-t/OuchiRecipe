class CreatePostRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_recipes do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :serving, null: false
      t.text :advice, null: false
      t.boolean :is_draft, null: false, default: true
      t.timestamps
    end
  end
end
