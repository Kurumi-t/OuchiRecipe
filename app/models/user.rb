class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
