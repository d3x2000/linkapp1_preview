class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  #before_action :set_comment, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.reverse
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comments = Comment.where(article_id: params[:id]).all
    @comment = Comment.new
    @comment.article_id = params[:id]
    @vote = Vote.new
    #@vote.article_id = params[:id]
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.user_id == current_user.id
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      unless params[:article][:vote] == nil
        edit_vote_params
      end
      params.require(:article).permit(:title, :description, :url, :img, :vote, :vote_up, :vote_down)
    end

    def edit_vote_params
      if params[:article][:vote] == 'up'
        params[:article][:vote_up] = @article.vote_up + 1
      elsif params[:article][:vote] == 'down'
        params[:article][:vote_down] = @article.vote_down + 1
      end
      params[:article].delete :vote
    end
end
