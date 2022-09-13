class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post_recipe, optional: true
end
