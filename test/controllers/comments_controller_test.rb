require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @test_comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    sign_in users(:one)
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { article_id: @test_comment.article_id, comment_text: @test_comment.comment_text } }
    end

    assert_redirected_to article_url(@test_comment.article_id)
  end

  test "should show comment" do
    get comment_url(@test_comment)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_comment_url(@test_comment)
    assert_response :success
  end

  test "should update comment" do
    sign_in users(:one)
    patch comment_url(@test_comment), params: { comment: { article_id: @test_comment.article_id, comment_text: @test_comment.comment_text } }
    assert_redirected_to article_url(@test_comment.article_id)
  end

  test "should destroy comment" do
    sign_in users(:one)
    assert_difference('Comment.count', -1) do
      delete comment_url(@test_comment)
    end

    assert_redirected_to article_url(@test_comment.article_id)
  end
end
