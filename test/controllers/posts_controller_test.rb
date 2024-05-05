# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in users(:one)
    post posts_url, params: { post:
                                {
                                  body: @post.body,
                                  category_id: @post.category_id,
                                  title: @post.title,
                                  user_id: @post.user_id
                                } }
    #debugger
    new_post = Post.find(@post.id)

    assert { new_post.present? }
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should destroy post' do
    sign_in users(:one)
    debugger
    delete post_url(@post)
    post = Post.find_by(id: @post.id)

    assert_nil post
  end
end
