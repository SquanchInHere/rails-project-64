# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :user_id, inverse_of: :posts

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :body, presence: true, length: { minimum: 100, maximum: 4000 }
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :category_id, presence: true

  scope :user_like, ->(user_id) { likes.where(user_id:) }
  scope :with_association, -> { includes(:category, :creator).order(created_at: :desc) }
end
