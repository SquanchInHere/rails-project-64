# frozen_string_literal: true

module Posts
  class LikesController < Posts::ApplicationController
    before_action :authenticate_user!
    before_action :current_like, only: %i[destroy]

    def create
      resource_post
      @resource_post.likes.find_or_create_by(user: current_user)

      redirect_to @resource_post
    end

    def destroy
      resource_post

      @post_like&.destroy
      redirect_to @resource_post
    end

    private

    def current_like
      @post_like = PostLike.find_by(id: params[:id], user: current_user)
    end
  end
end
