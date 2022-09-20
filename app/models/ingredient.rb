class Ingredient < ApplicationRecord
  belongs_to :post_recipe, optional: true
  belongs_to :shopping_list, optional: true

  validates :food_name, presence: true
  def self.search(words)
    @ingredient = Ingredient.where("food_name LIKE ?", "%#{words}%")
  end
end
