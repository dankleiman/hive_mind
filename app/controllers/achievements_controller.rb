class AchievementsController < ApplicationController
  before_filter :authorize

  def index
    @achievements = Achievement.all - Achievement.voted_on_achievements(current_user)
    @vote = Vote.new
    @top_achievements = Achievement.top_achievements
    @achievement = Achievement.new
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user_id = current_user.id
    if @achievement.save
      flash[:notice] = "Successfully added."
      redirect_to achievements_path
    else
      flash[:alert] = "Could not save your achievement."
      render :new
    end

  end

  def edit
    if current_user.admin?
      @achievements = Achievement.all
    else
      flash[:alert] = 'You are not allowed to access that page.'
      redirect_to achievements_path
    end
  end

  def destroy
    if current_user.admin?
      achievement = Achievement.find(params[:id])
      achievement.destroy
      flash[:notice] = 'Successfully deleted.'
      redirect_to '/achievements/edit'
    end
  end

  private

  def achievement_params
    params.require(:achievement).permit(:task)
  end
end
