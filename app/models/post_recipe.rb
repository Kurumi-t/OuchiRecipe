class PostRecipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ingredients, dependent: :destroy
  has_many :making_recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :making_recipes, allow_destroy: true, reject_if: :all_blank

  has_one_attached :recipe_image
  validates :title, length: { maximum: 14 }, presence: true
  validates :serving, presence: true
  validates :advice, length: { maximum: 80 }, presence: true
  validates :is_draft, presence: true
  with_options presence: true, on: :publicize do
    validates :serving
    validates :is_draft
  end
  validates :title, length: { maximum: 14 }, on: :publicize
  validates :advice, length: { maximum: 80 }, on: :publicize

  def get_recipe_image(width, height)
    unless recipe_image.attached?
      file_path = Rails.root.join('app/assets/images/No-image.jpg')
      recipe_image.attach(io: File.open(file_path), filename: 'recipe-default-image.jpg', content_type: 'image/jpeg')
    end
    recipe_image.variant(resize_to_limit: [width, height]).processed
  end
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  def self.search(words)
    @post_recipe = PostRecipe.where("title LIKE ?", "%#{words}%")
  end
end
