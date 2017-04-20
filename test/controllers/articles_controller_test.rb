require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @article = articles(:one)

    @update = {
      title: 'Wielkie wydarzenie XXI wieku!',
      description: 'To wlasnie zdarzy sie tego dnia, badz gotowy na nocne obserwacje!',
      url: 'http://google.com'
    }
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    sign_in users(:one)
    assert_difference('Article.count') do
      post articles_url, params: { article: {
        title: 'Wielkie wydarzenie XXI wieku?',
        description: 'To wlasnie zdarzy sie tego dnia, badz gotowy na nocne obserwacje?',
        url: 'http://microsoft.com',
        user_id: users(:one).id
      } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  #test "should update article" do
  #  sign_in users(:one)
  #  patch article_url(@article), params: { article: @update }
  #  assert_redirected_to article_url(@article)
  #end

  test "should destroy article" do
    sign_in users(:one)
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
