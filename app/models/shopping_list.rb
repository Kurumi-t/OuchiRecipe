class ShoppingList < ApplicationRecord
  belongs_to :user, optional: true

  validates :food_name, presence: true
  validates :amount, presence: true
  validates :unit, presence: true
end
