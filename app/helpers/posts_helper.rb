# frozen_string_literal: true

module PostsHelper
  def my_like(post, user)
    post.likes.user_likes(user).first
  end

  def body_preview(body)
    sliced = body.slice(0, 200)

    sliced.size < body.size ? "#{sliced}..." : body
  end
end
