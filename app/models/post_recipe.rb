class PostRecipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  has_many :foods
  accepts_nested_attributes_for :foods
  has_many :making_recipes, dependent: :destroy
  accepts_nested_attributes_for :making_recipes
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :recipe_image
  validates :title, presence: true
  validates :advice, presence: true
  validates :is_draft, presence: true

  def get_recipe_image(width, height)
    unless recipe_image.attached?
      file_path = Rails.root.join('app/assets/images/No-image.png')
      recipe_image.attach(io: File.open(file_path), filename: 'recipe-default-image.jpg', content_type: 'image/jpeg')
    end
    recipe_image.variant(resize_to_limit: [width, height]).processed
  end
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  def self.looks(searches, words)
    if searches == "perfect_match"
      @post_recipe = PostRecipe.where("title LIKE ?", "#{words}")
    else
      @post_recipe = PostRecipe.where("title LIKE ?", "%#{words}%")
    end
  end
end
