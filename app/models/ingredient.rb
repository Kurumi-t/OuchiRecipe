class Ingredient < ApplicationRecord
  belongs_to :post_recipe, optional: true
  belongs_to :shopping_list, optional: true
  with_options presence: true, on: :publicize do
    validates :food_name
  end
  def self.search(words)
    @ingredient = Ingredient.where("food_name LIKE ?", "%#{words}%")
  end
end
