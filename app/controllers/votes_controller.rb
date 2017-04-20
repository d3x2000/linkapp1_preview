class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    if Vote.exists?(user_id: current_user.id, article_id: params[:vote][:article_id])
      @vote = Vote.find_by(user_id: current_user.id, article_id: params[:vote][:article_id])
      update
    else
      @vote = current_user.votes.new(vote_params)
      respond_to do |format|
        if @vote.save
          format.html { redirect_to article_url(@vote.article_id), notice: 'Vote was successfully created.' }
          format.js
          format.json { render :show, status: :created, location: @vote }
        else
          format.html { render :new }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    if @vote.user_id == current_user.id
      respond_to do |format|
        if @vote.update(vote_params)
          format.html { redirect_to article_url(@vote.article_id), notice: 'Vote was successfully updated.' }
          format.js
          format.json { render :show, status: :ok, location: @vote }
        else
          format.html { render :edit }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    if @vote.user_id == current_user.id
      @vote.destroy
      respond_to do |format|
        format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:article_id, :vote_type)
    end
end
