# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count

  scope :user_likes, ->(user) { where(user:) }
end
