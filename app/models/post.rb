# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user, inverse_of: :posts

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :body, presence: true, length: { minimum: 100, maximum: 4000 }
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }

  scope :user_like, ->(user_id) { likes.where(user_id:) }
end
