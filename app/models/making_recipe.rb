class MakingRecipe < ApplicationRecord
  belongs_to :post_recipe, optional: true

  validates :recipe, presence: true
end
