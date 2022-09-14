class Ingredient < ApplicationRecord
  belongs_to :post_recipe, optional: true
  belongs_to :shopping_list, optional: true
  has_many :foods

  validates :serving, presence: true
  validates :amount, presence: true
  def self.looks(searches, words)
    if searches == "perfect_match"
      @ingredient = Ingredient.where("food_name LIKE ?", "#{words}")
    else
      @ingredient = Ingredient.where("food_name LIKE ?", "%#{words}%")
    end
  end
end
