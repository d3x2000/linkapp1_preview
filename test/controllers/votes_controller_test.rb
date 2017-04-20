require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get votes_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_url
    assert_response :success
  end

  test "should create vote" do
    sign_in users(:one)
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { article_id: articles(:two).id, vote_type: @vote.vote_type, user_id: @vote.user_id } }
    end

    assert_redirected_to article_url(articles(:two).id)
  end

  test "should show vote" do
    get vote_url(@vote)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_vote_url(@vote)
    assert_response :success
  end

  test "should update vote" do
    sign_in users(:one)
    patch vote_url(@vote), params: { vote: { article_id: @vote.article_id, vote_type: true, user_id: @vote.user_id } }
    assert_redirected_to article_url(@vote.article_id)
  end

  test "should destroy vote" do
    sign_in users(:one)
    assert_difference('Vote.count', -1) do
      delete vote_url(@vote)
    end

    assert_redirected_to votes_url
  end
end
