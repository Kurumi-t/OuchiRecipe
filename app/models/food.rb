class Food < ApplicationRecord
  belongs_to :fridge, optional: true
  belongs_to :making_recipe, optional: true
  belongs_to :shopping_list, optional: true
  enum genre: { vegetable: 0, meat: 1, seafood: 2, staple_food_and_flour: 3, eggs_and_milk_and_beans: 4, fruit_and_dessert: 5, seasoning: 6, others: 7 }

  validates :food_name, presence: true
  validates :genre, presence: true
  validates :unit, presence: true
  validates :weight_per_unit, presence: true
end
