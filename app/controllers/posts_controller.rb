# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :exists_likes, only: %i[show]

  # GET /posts or /posts.json
  def index
    @posts = Post.with_association
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: t('post.notice.success_created') }
      else
        format.html { render :new, status: :unprocessable_entity, alert: t('post.notice.failed_created') }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: t('post.notice.success_updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: t('post.notice.success_destroyed') }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.with_association.find(params[:id])
  end

  def exists_likes
    @liked_by_like = @post.likes.user_likes(current_user).exists?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :category_id)
  end
end
