# frozen_string_literal: true

module Posts
  class CommentsController < Posts::ApplicationController
    before_action :authenticate_user!

    def create
      resource_post
      @comment = @resource_post.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to @resource_post, notice: t('comment.notice.success_created')
      else
        redirect_to @resource_post, alert: t('comment.notice.failed_created')
      end
    end

    private

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
