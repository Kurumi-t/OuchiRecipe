class PostRecipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ingredients, dependent: :destroy
  has_many :making_recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :making_recipes, allow_destroy: true

  has_one_attached :recipe_image
  with_options presence: true, on: :publicize do
    validates :recipe_image
    validates :title, length: { maximum: 20 }
    validates :serving
    validates :advice, length: { maximum: 80 }
  end
  validates_associated :making_recipes
  validates_associated :ingredients

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
    @post_recipe = PostRecipe.where("title LIKE ?", "%#{words}%").where(is_draft: false)
  end

  def self.create_all_ranks
    PostRecipe.find(Favorite.group(:post_recipe_id).order('count(post_recipe_id) desc').limit(4).pluck(:post_recipe_id))
  end
end
