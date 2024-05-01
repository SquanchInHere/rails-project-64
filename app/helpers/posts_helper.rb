# frozen_string_literal: true

module PostsHelper
  def my_like(post, user)
    post.likes.user_likes(user).first
  end

  def likes_count(post)
    post.likes.count
  end
end
