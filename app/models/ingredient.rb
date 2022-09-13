class Ingredient < ApplicationRecord
  belongs_to :post_recipe, optional: true
  belongs_to :shopping_list, optional: true
  has_many :foods

  validates :serving, presence: true
  validates :amount, presence: true
end
