class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  def index
    @follows = Follow.all
  end

  def show
  end

  def new
    @follow = Follow.new
  end

  def edit
  end

  def create
    @follow = Follow.new(follow_params)
    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.'}
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @follow.update(status_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.'}
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Follow was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    def set_follow
      @follow = Follow.find(params[:id])
    end

    def follow_params
      params.require(:follow).permit(:follower_id, :following_id)
    end
end
