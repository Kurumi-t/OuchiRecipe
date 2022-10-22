class MakingRecipe < ApplicationRecord
  belongs_to :post_recipe, optional: true
  with_options presence: true, on: :publicize do
    validates :recipe
  end
end